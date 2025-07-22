`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    casex (m) // use casex instead of case
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {{ParOut[7:1], ParOut[0]}, ParOut[7:1]};
        5: ParOut <= {ParOut[7:1], ParOut[0], ParOut[7:1]};
        6: ParOut <= {ParOut[7:1], ParOut[0], ParOut[7:1], ParOut[0]};
        7: ParOut <= {ParOut[7:1], ParOut[0], ParOut[7:1], ParOut[0], ParOut[7:1]};
        8: ParOut <= {ParOut[7], {{ParOut[7], ParOut[0]}, ParOut[7]}, {ParOut[7], ParOut[0]}};
        9: ParOut <= {ParOut[7], {ParOut[7], ParOut[0], ParOut[7]}, {ParOut[7], ParOut[0], ParOut[7]}};
        10: ParOut <= {{ParOut[7], ParOut[0], ParOut[7], ParOut[0]}, {ParOut[7], ParOut[0], ParOut[7]}, {ParOut[7], ParOut[0]}};
        11: ParOut <= {ParOut[7], {ParOut[7], ParOut[0], ParOut[7], ParOut[0], ParOut[7]}, {ParOut[7], ParOut[0], ParOut