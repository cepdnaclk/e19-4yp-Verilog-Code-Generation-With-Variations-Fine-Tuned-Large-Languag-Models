`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb
begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Modified Code without any issue:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb
begin
    case (mode)
        0: ALUout[3:0] = left[3:0] + right[3:0];
        1: ALUout[3:0] = left[3:0] - right[3:0];
        2: ALUout[3:0] = left[3:0] & right[3:0];
        3: ALUout[3:0] = left[3:0] | right[3:0];
    endcase
end
endmodule
### Example of issue in original code:
`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always @(left, right, mode) begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
`timescale 1ns/100ps
module top(input clk, input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
ALU8 alu8(.left(left