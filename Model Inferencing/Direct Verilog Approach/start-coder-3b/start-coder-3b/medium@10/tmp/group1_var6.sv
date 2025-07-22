`module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
//  ParOut = ParIn if m = 3
//  ParOut = ParOut[7:1] if m = 1
//  ParOut = {ParOut[6:0], sr} if m = 2
//  else ParOut = 8'bX;
    if (m == 3) begin
        ParOut <= ParIn;
    end else begin
        case (m)
//          case (vec[m])
            0: ParOut <= ParOut;
            1: ParOut <=   {sl, ParOut[7:1]};
            {ParOut[6:0], sr} : ParOut <= {ParOut[6:0], sr};
            3: ParOut <= ParIn;
            default: ParOut <= 8'bX;
        endcase
    end
end
endmodule
`### Base Verilog Code:
`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    ParOut <= ParOut[7:1] if m == 1;
    ParOut <= {ParOut[6:0], sr} if m == 2;
end