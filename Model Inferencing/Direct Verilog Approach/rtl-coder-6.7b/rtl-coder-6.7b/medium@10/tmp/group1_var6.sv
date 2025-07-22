`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m) inside
        {0, [2:4]}: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        {2, 3}: ParOut <= ParIn;