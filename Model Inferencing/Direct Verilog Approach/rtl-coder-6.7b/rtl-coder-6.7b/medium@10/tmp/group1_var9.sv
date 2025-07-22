`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        2, 3: ParOut <= ParIn; // case 2 and case 3
        default: ParOut <= ParOut;
    endcase
end
endmodule