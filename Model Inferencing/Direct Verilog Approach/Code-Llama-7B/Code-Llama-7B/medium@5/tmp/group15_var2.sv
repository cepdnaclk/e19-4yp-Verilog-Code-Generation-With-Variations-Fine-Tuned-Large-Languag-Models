`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = {left[3:0], left[7:4]} + {right[3:0], right[7:4]} + {left[0], left[1], left[2], left[7], 5'b0};
        1: ALUout = {left[3:0], left[7:4]} - {right[3:0], right[7:4]} - {left[0], left[1], left[2], left[7], 5'b0};
        2: ALUout = {left[3:0], left[7:4]} & {right[3:0], right[7:4]} & {left[0], left[1], left[2], left[7], 5'b0};