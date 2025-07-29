`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always @(*) begin
    case (mode)
        0: ALUout[3] = left[3] + right[3];
        1: ALUout[3] = left[3] - right[3];