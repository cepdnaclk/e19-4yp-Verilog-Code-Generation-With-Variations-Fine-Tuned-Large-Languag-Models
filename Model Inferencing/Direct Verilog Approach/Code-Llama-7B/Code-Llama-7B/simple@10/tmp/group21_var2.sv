```verilog
module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
rand bit a;
rand bit b;
rand bit c;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = 1'b1;
initial begin
$display("begin, a = %d, b = %d, c = %d", a, b, c);
wait(a);
$display("wait a, a = %d, b = %d, c = %d", a, b, c);
wait(b);
$display("wait b, a = %d, b = %d, c = %d", a, b, c);
wait(c);
$display("wait c, a = %d, b = %d, c = %d", a, b, c);