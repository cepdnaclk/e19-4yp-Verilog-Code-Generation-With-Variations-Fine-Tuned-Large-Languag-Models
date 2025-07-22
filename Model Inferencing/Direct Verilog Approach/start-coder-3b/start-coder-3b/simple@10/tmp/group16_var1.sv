```verilog
module or_ffl_fr(input a, input b, input c, input force, input release, output y);
  assign y = a | b | c | a & b | a & c | b & c | a & b & c;
endmodule
```/veriloggen/types/struct_unpack.py

import sys

from. import BaseTypes
from.struct import _Struct

class _StructUnpack(_Struct):
    """
    A structure which contains unpacked fields.
    """
    def __init__(self, fields, typename="struct"):
        self._typename = typename if isinstance(typename, str) else "struct_unpack"
        super().__init__(fields, typename=self._typename)

    def _get_typename(self, fields):
        """get type name"""
        if not isinstance(fields, dict):
            return self._typename
        else:
            return self._typename + "_" + "_".join([f"{k}_{v}" for k, v in fields.items()])

    def as_instance(self, name):
        return super().as_instance(name)

    def __call__(self, *args, **kwargs):

        if not isinstance(args, (list, tuple)) or not isinstance(args[0], (list, tuple)):
            raise ValueError("Invalid parameters. 1st parameter must be a list.")

        inputs = []
        self._unpack(args, inputs)
        if len(inputs)!= len(self.fields):
            msg = f"Number of inputs must be {len(self.fields)} but given {len(inputs)}."
            raise ValueError(msg)
        return super(BaseTypes.Logic, self).__call__(*inputs, **kwargs)

    def _pack(self, inputs, ret):
        """pack"""
        if not self.fields:
            return inputs[0]
        d = dict(zip(self.fields.keys(), inputs))
        for k, v in d.items():
            ret[k] = v
        return ret

    def _unpack(self, inputs, ret):
        """unpack"""
        if not self.fields:
            return inputs[0]
        d = dict(zip(self.fields.keys(), inputs))
        for k, v in d.items():
            ret.append(v)
        return ret
/veriloggen/generators/vcd_generator.py

import os
import re
import sys
import inspect

import veriloggen.stream as S
from veriloggen import Module, clock, enable, reset, randstate, RandSeq
from veriloggen.stream import Stream, stream, StreamSignal
from veriloggen.types import Int, Bits, Logic, WildCard, Bits1, Bits2, Bits3, Bits4, Bits5, Bits6, Bits7, \
    Bits8, Bits9, Bits10, Bits11, Bits12, Bits13, Bits14, Bits15, Bits16, Bits17, Bits18, Bits19, Bits20, Bits21, Bits22, Bits23, Bits24, Bits25, Bits26, Bits27, Bits28, Bits29, Bits30, Bits31, Bits32, Bits33, Bits34, Bits35, Bits36, Bits37, Bits38, Bits39, Bits40, Bits41, Bits42, Bits43, Bits44, Bits45, Bits46, Bits47, Bits48, Bits49
Bit, Bit1, Bit2, Bit3, Bit4, Bit5, Bit6, Bit7, Bit8, Bit9, Bit10, Bit11, Bit12, Bit13, Bit14, Bit15, Bit16
from veriloggen import verilog

from collections import OrderedDict


class VCDGenerator():
    def __init__(self, output_dir=".", append_date=False):
        self.output_dir = output_dir
        self.append_date = append_date
        self.stream_info = OrderedDict()
        self.io_info = OrderedDict()
        self.signals = OrderedDict()
        self.names = OrderedDict()
        self.all_signals = OrderedDict()
        self.all_names = OrderedDict()
        self.module = None

    def set_module(self, module):
        """Set Top-level module."""
        self.module = module

    def dump(self, filename, append_date=False, **kwargs):
        """"""
        filename = filename + ".vcd" if not filename.endswith(".vcd") else filename
        if not filename.endswith(".vcd"):
            filename += ".vcd"

        if not append_date:
            os.makedirs(self.output_dir, exist_ok=True)
            with open(os.path.join(self.output_dir, filename), "w") as f:
                self.dump(f, **kwargs)
            return

        today = datetime.now().strftime("%Y%m%d")
        filename = filename.replace(".vcd", f"_gen_{today}.vcd")
        if not filename.endswith(".vcd"):
            filename += ".vcd"
        os.makedirs(self.output_dir, exist_ok=True)
        with open(os.path.join(self.output_dir, filename), "w") as f:
            self.dump(f, **kwargs)
        return

    def dump(self, fobj, append_date=False, **kwargs):
        """"""
        fobj.write("$_version: 5:1:1$_\n")
        fobj.write("$_date: {}$_\n".format(datetime.now().isoformat()))
        fobj.write("$_f$:\n")
        fobj.write("$_end$\n")
        fobj.write("$_f$_vcd_$timescale$:\n")
        fobj.write("1ns$ $timescale$\n")
        fobj.write("$_end$\n")
        fobj.write("$_f$_vcd_$scope$:\n")
        fobj.write("$scope module {}\n".format(self.module.name))
        for sig_name in self.signals:
            fobj.write("$var wire {0} {1} {2} {3}\n".format(self.signals[sig_name], sig_name,
                                                          self.names[sig_name], self.stream_info[sig_name]))
        for sig_name in self.all_signals:
            fobj.write("$var wire {0} {1} {2}