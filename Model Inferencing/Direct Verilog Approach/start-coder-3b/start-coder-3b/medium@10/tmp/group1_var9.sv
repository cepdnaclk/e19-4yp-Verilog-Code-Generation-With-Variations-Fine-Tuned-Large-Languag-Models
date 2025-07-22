`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= {ParIn[7:1], ParOut[6:0]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule`
egister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= {ParIn[7:1], ParOut[6:0]};
        default: ParOut <= 8'bX;
    endcase
end
endmodule
/ShiftRegister8_1.v
timescale 1ns/100ps
module ShiftR