module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule
### Verification Code:
program test;
rand bit [3:0] xa, xb, xc, xd;
rand bit g, h, f;
constraint c1 { (xa == 4'b0011) -> (xb == 4'b1110); }
constraint c2 { (xc == 4'b0011) -> (xd == 4'b1110); }
constraint c3 { (g == (xa & xc)) || (g == (xb & xd)); }
constraint c4 { (h == (xa | xc)) && (h == (xb | xd)); }
constraint c5 { (f == g) || (f == h); }
bit [3:0] x1, x2, x3, x4;
bit [1:0] f_expected;
bit [1:0] g_expected;
bit [1:0] h_expected;
bit [1:0] f_actual;
bit [1:0] g_actual;
bit [1:0] h_actual;

initial begin
x1 = xa;
x2 = xb;
x3 = xc;
x4 = xd;

f_expected = f? 1'b1 : 1'b0;
g_expected = g? 1'b1 : 1'b0;
h_expected = h? 1'b1 : 1'b0;

$display(
"\nx1\tx2\tx3\tx4\tf\tg\th\n%b\t%b\t%b\t%b\t%b\t%b\t%b", x1, x2, x3, x4, f_expected, g_expected, h_expected);
fork
repeat(10) begin
	@(negedge tb.clk)
	if (x1 == 4'b0011) begin : randomization_successful
	x2 = 4'b1110;
	x3 = 4'b0111;
	x4 = 4'b0101;
	end

	if (x3 == 4'b0011) begin : randomization_successful
	x1 = 4'b1100;
	x2 = 4'b1000;
	x4 = 4'b1110;
	end
	forever @(negedge tb.clk) #1;
end
join_any
disable randomization_successful;
$display("\nRandomization failed or aborted after 10 cycles");
end
always begin
#50;
$display(
"\nx1\tx2\tx3\tx4\tf\tg\th\n%b\t%b\t%b\t%b\t%b\t%b\t%b", x1, x2, x3, x4, f, g, h);
end
endprogram
### Base Testbench Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule
### Modified Testbench Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule
### Modified Testbench Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule
### Modified Testbench Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule
### Passed Testbench Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule
### Testbench Code from Verification Code:
`timescale 1ns / 1ps
module tb;
reg clk;

example4 example_4 (clk);

initial begin
clk = 1'b0;
#10;
clk = 1'b1;
#5;
clk = 1'b0;
end

endmodule