`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout[3:0] = left[3:0] + right[3:0];
        1: ALUout[3:0] = left[3:0] - right[3:0];
        2: ALUout[3:0] = left[3:0] & right[3:0];
        3: ALUout[3:0] = left[3:0] | right[3:0];
        default: ALUout = 8'bX;
    endcase
end
endmodule