`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m) inside //Add inside
        {0, 3}: ParOut <= ParOut;
        {1, 2}: ParOut <= {sl, ParOut[7:1]};
        {2, 1}: ParOut <= {ParOut[6:0], sr};
        default: ParOut <= 8'bX;
    endcase
end
endmodule