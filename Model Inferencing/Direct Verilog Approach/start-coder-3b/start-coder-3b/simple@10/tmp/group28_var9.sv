module example12(in, clk, rst, out);
input clk, rst;
input [2:0] in;
output [3:0] out;
wire [3:0] outd[3:0];
assign outd = in + 1;
case (in)
2'b00: outd = 5'd4;
2'b01: outd = 5'd0;
2'b10: outd = 5'd0;
default: out