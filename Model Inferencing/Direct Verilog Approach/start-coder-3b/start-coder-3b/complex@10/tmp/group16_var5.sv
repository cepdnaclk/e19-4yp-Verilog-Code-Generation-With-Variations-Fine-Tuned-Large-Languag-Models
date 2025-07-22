module TOP1(CLK,RST_X);
  output CLK;
  input RST_X;
  localparam x = 1;
  localparam y = [2,3,4,5];

  always @(posedge CLK or posedge RST_X) begin
    if(RST_X) begin
      // Initialize arrays
      // Initialize arrays
      y = 0;
      // Initialize arrays
      y = 0;
    end 
    else begin
      if(0x1) begin
        y[4] <= x;
      end 
    end
  end
endmodule

module top_module;
  wire CLK;
  reg RST_X;

  DUT uut(
   .CLK(CLK),
   .RST_X(RST_X)
  );

  initial begin
    $dumpfile("TOP1.vcd");
    $dumpvars(0,TOP1);
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    RST_X = 0;
    #10;
    RST_X = 1;
  end
endmodule
"""


def test_array_inside_constant_package():
    veriloggen.reset()
    test_module = test_array_inside_constant_package_code
    expected_rtl_output = test_array_inside_constant_package_expected_rtl_output
    expected_vloggen_output = test_array_inside_constant_package_expected_vloggen_output

    prefix = "test_array_inside_constant_package"
    rtlff = parse(test_module)
    assert rtlff.verilog(prefix + "_rtl_expected.v", param_type=None) == expected_rtl_output
    vlogff = parse(expected_vloggen_output)
    assert vlogff.vlog(prefix + "_vlog_expected.v") == expected_vloggen_output
/veriloggen/common/rtl_submodule.py
from __future__ import absolute_import
from __future__ import print_function
from __future__ import division

from lxml import etree

import veriloggen
from veriloggen import parse, builder, dataflow, log
from veriloggen.utils import to_hex, cformat, name_with_type
from veriloggen.sim.utils import get_sim_params
from veriloggen.common.rtl_array_slice import rtl_array_slice
from veriloggen.common.rtl_if import rtl_if
from veriloggen.common.rtl_if_eq import rtl_if_eq
from veriloggen.common.rtl_if_not_eq import rtl_if_not_eq
from veriloggen.common.rtl_if_and import rtl_if_and
from veriloggen.common.rtl_if_or import rtl_if_or
from veriloggen.common.rtl_if_ne import rtl_if_ne

from collections import Iterable

__all__ = ["rtl_submodule"]


class rtl_submodule(object):
    """
    A generic function to call other modules as RTL function.

    :param module_name:
        Name of the module which is defined in the current context.
    :param name:
        Name to be used for the new module. If not provided, the name of the
        input will be used.
    :param param_type:
        Parameter type of the input module.
    :param inputs:
        Input ports of the module. If the input is not in an iterable, it will be
        converted to a list.  Can be either a list of input port names, a
        dictionary (name : port reference), a list of dictionaries, or a nested
        list of input ports.
    :param outputs:
        Output ports of the module. If the input is not in an iterable, it will be
        converted to a list.  Can be either a list of output port names, a
        dictionary (name : port reference), a list of dictionaries, or a nested
        list of output ports.
    :param generate_only:
        If True, only generate the module and do not instantiate it.
    :param kwargs:
        Other parameter to be used for the input module.
    """

    def __init__(self, module_name, name=None, param_type=None, inputs=None, outputs=None, generate_only=False, **kwargs):
        self.module_name = module_name
        self.name = name
        self.param_type = param_type
        self.inputs = inputs
        self.outputs = outputs
        self.generate_only = generate_only
        self.kwargs = kwargs

    def __call__(self, *args, **kwargs):
        name = self.name
        param_type = self.param_type
        inputs = self.inputs
        outputs = self.outputs
        generate_only = self.generate_only
        kwargs.update(self.kwargs)

        sim_params = get_sim_params(kwargs)
        inputs, outputs, kwargs = dataflow.get_dataflow_ports(sim_params, inputs, outputs, kwargs)

        if param_type is None:
            param_type = sim_params['param_type']

        assert param_type in ['normal', 'param'], "param_type must be either 'normal' or 'param'"

        if isinstance(inputs, Iterable):
            inputs = dataflow.flatten(inputs)
        else:
            inputs = [inputs]

        if isinstance(outputs, Iterable):
            outputs = dataflow.flatten(outputs)
        else:
            outputs = [outputs]

        if len(inputs)!= len(outputs):
            raise ValueError("Number of inputs of inputs and outputs must be equal")

        module = parse(f"""module {name}();""")
        module.add(f"  parameter param_type = '{param_type}';")

        for i, (inp, out) in enumerate(zip(inputs, outputs)):
            name_i = name_with_type(i, inp, param_type=param_type)
            name_o = name_with_type(i, out, param_type=param_type)

            if param_type == "normal":
                module.add(f"  input {inp};")
                module.add(f"  output {out};")
                module.add(f"  assign {name_o} = {inp};")
            elif param_type == "param":
                module.add(f"  input [7:0] {inp};")
                module.add(f"  output [7:0] {out};")
                module.add(f"  assign {name_o} = {inp};")

        for i, (inp, out) in enumerate(zip(inputs, outputs)):
            name_i = name_with_type(i, inp, param_type=param_type)
            name_o = name_with_type(i, out, param_type=param_type)

            if param_type == "normal":
                kwargs[f"{name_i}"] = inp
                kwargs[f"{name_o}"] = out
                self.module_name(module, **kwargs)
                kwargs[f"{name_i}"] = None
                kwargs[f"{name_o}"] = None
            elif param_type == "param":
                kwargs[f"{name_i}"] = inp
                kwargs[f"{name_o}"] = out
                self.module_name(module, **kwargs)
                kwargs[f"{name_i}"] = None
                kwargs[f"{name_o}"] = None

        if generate_only:
            return module
        else:
            return module.to_verilog(name), module

    def __str__(self):
        return str(self.module_name)

    def __repr__(self):
        return '<Submodule {0} {1}>'.format(self.name, self.module_name)


@veriloggen.module()
def module_add(clk, rst, A, B, C, param_type='normal'):
    if param_type == 'normal':
        clk = builder.input('clk', size=1, name='clk')
        rst = builder.input('rst', size=1, name='rst')
        A = builder.input('A', size=32, name='A')
        B = builder.input('B', size=32, name='B')
        C = builder.output('C', size=32, name='C')

    if param_type == 'param':
        clk = builder.input('clk', size=1, name='clk')
        rst = builder.input('rst', size=1, name='rst')
        A = builder.input('A', size=16, name='A')
        B = builder.input('B', size=16, name='B')
        C = builder.output('C', size=16, name='C')

    # if param_type == 'param':
    #     clk = builder.input('clk', size=1, name='clk')
    #     rst = builder.input('rst', size=1, name='rst')
    #     A = builder.input('A', size=32, name='A')
    #     B = builder.input('B', size=32, name='B')
    #