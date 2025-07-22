```
timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [2:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;