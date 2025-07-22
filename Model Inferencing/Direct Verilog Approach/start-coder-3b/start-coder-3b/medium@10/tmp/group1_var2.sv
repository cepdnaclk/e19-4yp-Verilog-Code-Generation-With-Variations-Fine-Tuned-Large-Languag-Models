`timescale 1ns/100ps
module ShiftRegister13 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [12:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[12:1]};
        2: ParOut <= {ParOut[11:1], sr};
        3: ParOut <= ParIn;
        default: ParOut <= 13'bX;
    endcase
end
endmodule
### Results:
| Test | Time (ns) |