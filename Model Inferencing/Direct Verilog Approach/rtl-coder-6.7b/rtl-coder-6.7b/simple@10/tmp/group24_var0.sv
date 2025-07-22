module Anding (input a, b, output y);
and (y, a, b);
endmodule


## Verilog-SVA Testbench:
module anding_test;
reg a;
reg b;
wire y;
Anding f1(.a(a),.b(b),.y(y));

initial begin
a = 'bz;
b = 'bz;

a = 'b0;
b = 'b0;

a = 'b0;
b = 'b1;

a = 'b1;
b = 'b0;

a = 'b1;
b = 'b1;

a = 'bx;
b = 'b1;

a = 'b1;
b = 'bx;

assert ($isunknown(a) | $isunknown(b) | $isunknown(y)) else
$display("x's");

assert (y == (a & b)) else $display("a and b");
end
endmodule