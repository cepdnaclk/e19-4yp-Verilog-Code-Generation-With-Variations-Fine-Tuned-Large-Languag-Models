union packed {
logic a;
logic b;
} x;
module Anding (input x, output y);
and (y, x.a, x.b);
endmodule
### Output:
Tested with Icarus Verilog v11.0 (devel) [Dec 22 2020]
-
x.a = '0' x.b = '1'
x.a = '1' x.b = '0'
x.a = '0' x.b = '0'
x.a = '1' x.b = '1'