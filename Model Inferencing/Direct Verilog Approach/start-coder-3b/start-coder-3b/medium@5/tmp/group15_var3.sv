`timescale 1ns/100ps
module ALU8_N (input [7:0] left, right, input [1:0] mode, output wire [7:0] ALUout);
parameter wsize = 8;
reg [wsize-1:0] x;
initial begin
    ALUout = x[1:0];
end
always begin
    x = left |