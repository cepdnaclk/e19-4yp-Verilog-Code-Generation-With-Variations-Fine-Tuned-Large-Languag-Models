`default_nettype none
`timescale 1ns / 1ns
module adder (output wire unsigned [7:0] sum, input wire [7:0] a, b);
wire [7:0] x;
assign x = a + b;
assign sum = x;
endmodule
### Run:
# make
# simv
### Output:
### Base:
$ display
#0:
a = 8'b00000010
b = 8'b00000011
x = 8'b00000101
sum = 8'b00000101
### Modified:
$ display
Error:
The number of bits in the