module test_carry;
parameter WIDTH=4;
`define COUNT 4
reg [WIDTH-1:0] d;
integer j;
wire c0;
generate
begin
for (j = 0; j < `COUNT; j = j + 1) begin
carry c1(c0, d[WIDTH-1], d[WIDTH-2]);
initial
begin
$monitor("time=%d d=%b---------cout=%b", $time, d, c0);
for (j = 0; j < 4; j = j + 1)
begin
d = j;
end
d = 'bx;
end
end
end
endgenerate
endmodule
## Variables
## `var` and `const`
### Base Verilog Code:
module test_var;
var [11:0] a;
integer i;
initial
begin
$monitor("time=%d a=%b", $time, a);
for (i = 0; i