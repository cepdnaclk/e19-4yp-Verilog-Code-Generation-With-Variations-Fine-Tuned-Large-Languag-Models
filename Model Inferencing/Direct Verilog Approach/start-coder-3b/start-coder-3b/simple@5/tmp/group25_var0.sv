module add_1_seq (input [3:0] a, input [3:0] b, output [3:0] s, input clk, input reset);
input a, b, clk, reset;
output s;
reg [3:0] s;
always @ (posed