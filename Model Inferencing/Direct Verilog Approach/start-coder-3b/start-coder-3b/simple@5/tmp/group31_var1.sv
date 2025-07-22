module func10(x1, x2, x3, f);
input  x1, x2, x3;
output bit [31:0] f;
assign f = (x1 | x2 | ~x3) | (~x1 | x2 | x3);
endmodule
/labs/lab3-verilog-flow-control/README.md
# Description:
This lab implements a simple 4-bit adder using the adder instruction and a 4-input NOT gate.
The input from the adder is set to 0 unless an error has occured due to an invalid input 
or an overflow during addition.
# Components Needed:
1. 4-input NOT gate
2. 4-bit adder
# Required Verilog Code:
### Base Verilog Code:
## Adder Module ##
module adder (a, b, c, s, t, o);
input [3:0] a, b;
output [3:0] s, t, o;

assign s = a + b;
assign t = a ^ b;
assign o = (s >= 8) | (t >= 8);
endmodule
## NOT Gate Module ##
module not_gate (a, b);
input [3:0] a;
output [3:0] b;

assign b = ~a;
endmodule
## Testbench Module ##
module tb (clk, reset, a, b, s, t, o);
reg clk;
reg reset;
reg [3:0] a;
reg [3:0] b;
reg [3:0] s;
reg [3:0] t;
reg [3:0] o;

always#5 clk =!clk;

initial reset = 1'b1;

always @(negedge clk)
if (reset) begin
a <= 3'b0000;
b <= 3'b0000;
s <= 3'b0000;
t <= 3'b0000;
o <= 1'b0;
end
else begin
a <=