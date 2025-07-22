module TOP1(
  input CLK,
  output reg [32-1:0] x,
  input [32-1:0] w
);
  reg [16-1:0] @w;
  localparam @w = 0x12345678;
  assign @w = w;

  reg [16-1:0] @x;
  localparam @x = 0x00000000;
  assign @x = x;

  always @(posedge CLK) begin
    if(RST_X) begin
      @x <= 0;
      @w <= 0;
    end else begin
      if((x < @w) && (@w < x)) @x <= @w + 1;
    end
  end
endmodule
"""

def test_comparators_inside_op():
    veriloggen.reset()
    test_module = parse(test_verilog)

    code = test_module.to_verilog()

    from pyverilog.vparser.parser import VerilogParser
    parser = VerilogParser()
    expected_parse = parser.parse(test_verilog)

    assert(expected_parse == test_module.verilog)
"""
Example of a Verilog module that contains a `parameter`
"""

import veriloggen as V

class TOP(V.Module):
    def __init__(self, data=None):
        self.io = IO = V.IO(name='IO')
        if data is None:
            self.io.in = V.Input(size=16)
            self.io.out = V.Output(size=16)
        else:
            self.io.in = V.Input(data=data, size=16)
            self.io.out = V.Output(size=16)
        self.io.clk = V.Input(0, name='CLK')

        self.reg = V.Reg('reg', size=16)
        self.submod1 = Submod1(self.reg.out)
        self.submod2 = Submod2(self.reg.out)

        self.io.reg = self.reg.out
        self.io.submod1 = self.submod1.out
        self.io.submod2 = self.submod2.out

        self.counter = 0
        self.clk_cnt = 0
        self.sub2_clk_cnt = 0

    def always_ff(self, data):
        self.counter += 1
        if self.counter >= 10:
            self.reg.next = self.io.in
            self.counter = 0
        else:
            self.reg.next = data

        self.clk_cnt += 1
        self.submod1.io.clk.next = self.io.clk
        self.sub2_clk_cnt += 1
        self.submod2.io.clk.next = self.submod1.io.clk

    def gen_code(self, v: V.VerilogModule) -> None:
        self.always_ff(self.reg.out)

class Submod1(V.Module):
    def __init__(self, x):
        self.io = IO = V.IO(name='IO')
        self.io.in = V.Input(x, name='X', size=16)
        self.io.out = V.Output(size=16)
        self.io.clk = V.Input(0, name='CLK')
        self.cnt = 0
        self.cnt_cnt = 0

    def gen_code(self, v: V.VerilogModule) -> None:
        self.cnt += 1
        if self.cnt == 10:
            self.io.out.next = 0x7ff00000

        self.cnt_cnt += 1
        if self.cnt_cnt == 10:
            self.io.out.next = self.io.in

        self.io.out.next = self.io.in

class Submod2(V.Module):
    def __init__(self, x):
        self.io = IO = V.IO(name='IO')
        self.io.in = V.Input(x, name='X', size=16)
        self.io.out = V.Output(size=16)
        self.io.clk = V.Input(0, name='CLK')
        self.cnt = 0
        self.cnt_cnt = 0

    def gen_code(self, v: V.VerilogModule) -> None:
        self.cnt += 1
        if self.cnt == 10:
            self.io.out.next = 0x6ff00000

        self.cnt_cnt += 1
        if self.cnt_cnt == 10:
            self.io.out.next = self.io.in

        self.io.out.next = self.io.in

#testbench

test_verilog = """
module tb_TOP;
  reg CLK;
  reg RST;
  wire [16-1:0] submod1;
  wire [16-1:0] submod2;

  initial begin
    CLK = 0;
    forever #5 CLK =!CLK;
  end

  initial begin
    RST = 0;
    #100;
    RST = 1;
    #100;
    RST = 0;
    #100;
  end

  tb_TOP
  uut
  (
   .CLK(CLK),
   .RST(RST),
   .submod1(submod1),
   .submod2(submod2)
  );

  initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    #100;
    $finish;
  end

endmodule
"""

test_module = TOP(0x12345678)

def test():
    veriloggen.reset()
    code = test_module.to_verilog()

    from pyverilog.vparser.parser import VerilogParser
    parser = VerilogParser()
    expected_parse = parser.parse(test_verilog)

    assert(expected_parse == test_module.verilog)
"""
Example of a Verilog module that contains a `parameter`
"""

import veriloggen as V

class TOP(V.Module):
    def __init__(self, data=None, num_bits=32):
        self.io = IO = V.IO(name='IO')
        if data is None:
            self.io.in = V.Input(size=num_bits)
            self.io.out = V.Output(size=num_bits)
        else:
            self.io.in = V.Input(data=data, size=num_bits)
            self.io.out = V.Output(size=num_bits)
        self.io.clk = V.Input(0, name='CLK')

        self.reg = V.Reg('reg', size=num_bits)

        self.counter = 0
        self.clk_cnt = 0

    def always_ff(self, data):
        self.counter += 1
        if self.counter >= 10:
            self.reg.next = data
            self.counter = 0
        else:
            self.reg.next = data

        self.clk_cnt += 1
        self.io.clk.next = self.clk_cnt == 10

    def gen_code(self, v: V.VerilogModule) -> None:
        self.always_ff(self.reg.out)

#testbench

test_verilog = """
module tb_TOP;
  reg CLK;
  reg RST;

  initial begin
    CLK = 0;
    forever #5 CLK =!CLK;
  end

  initial begin
    RST = 0;
    #100;
    RST = 1;
    #100;
    RST = 0;
    #100;
  end

  tb_TOP
  uut
  (
   .CLK(CLK),
   .RST(RST)
  );

  initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    #100;
    $finish;
  end

endmodule
"""

test_module = TOP(0x12345678, 16)

def test():
    veriloggen.reset()
    code = test_module.to_verilog()

    from pyverilog.vparser.parser import VerilogParser
    parser = VerilogParser()
    expected_parse = parser.parse(test_verilog)

    assert(expected_parse == test_module.verilog)
from.veriloggen3.datapath.csr import CSR, CSRReg
"""
Example of a Verilog module that contains a `parameter`
"""

import veriloggen as V

class TOP(V.Module):
    def __init__(self):
        self.