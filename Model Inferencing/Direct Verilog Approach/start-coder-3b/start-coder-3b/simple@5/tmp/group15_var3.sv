module cnt2(
input wire clk,
input wire rst,
output wire [7:0] cnt
);

reg [7:0] cnt = 0;
reg [7:0] cnt_max = 255;

always@(posedge clk or negedge rst)
begin
if(rst)
begin
cnt = 0;
end
else
begin
if(cnt < cnt_max)
begin
cnt = cnt + 1;
end
end
end
assign cnt = cnt;

endmodule

## 11.2.2 Project 2: Simple CPU

### Base Verilog Code:
module cpu (
wire  [7:0] opcode,
input [31:0] code,
input [7:0] reg,
input [7:0] reg1,
input [7:0] reg2,
input [7:0] reg3,
input [7:0] reg4,
input [31:0] reg5,
input [6:0] reg6,
input [9:0] reg7,
input [7:0] reg8,
input [31:0] reg9,
input [7:0] reg10,
input [6:0] reg11,
input [9:0] reg12,
input [7:0] reg13,
input [31:0] reg14,
input [7:0] reg15,
input [6:0] reg16,
input [9:0] reg17,
input [7:0] reg18,
input [31:0] reg19,
input [7:0] reg20,
input [6:0] reg21,
input [9:0] reg22,
input [7:0] reg23,
input [31:0] reg24,
input [7:0] reg25,
input [6:0] reg26,
input [9:0] reg27,
input [7:0] reg28,
input [31:0] reg29,
input [7:0] reg30,
input [6:0] reg31,
input [9:0] reg32,
input [7:0] reg33,
input [31:0] reg34,
input [7:0] reg35,
input [6:0] reg36,
input [9:0] reg37,
input [7:0] reg38,
input [31:0] reg39,
input [7:0] reg40,
input [6:0] reg41,
input [9:0] reg42,
input [7:0] reg43,
input [31:0] reg44,
input [7:0] reg45,
input [6:0] reg46,
input [9:0] reg47,
input [7:0] reg48,
input [31:0] reg49,
input [7:0] reg50,
input [6:0] reg51,
input [9:0] reg52,
input [7:0] reg53,
input [31:0] reg54,
input [7:0] reg55,
input [6:0] reg56,
input [9:0] reg57,
input [7:0] reg58,
input [31:0] reg59,
input [7:0] reg60,
input [6:0] reg61,
input [9:0] reg62,
input [7:0] reg63,
input [31:0] reg64,
input [7:0] reg65,
input [6:0] reg66,
input [9:0] reg67,
input [7:0] reg68,
input [31:0] reg69,
input [7:0] reg70,
input [6:0] reg71,
input [9:0] reg72,
input [7:0] reg73,
input [31:0] reg74,
input [7:0] reg75,
input [6:0] reg76,
input [9:0] reg77,
input [7:0] reg78,
input [31:0] reg79,
input [7:0] reg80,
input [6:0] reg81,
input [9:0] reg82,
input [7:0] reg83,
input [31:0] reg84,
input [7:0] reg85,
input [6:0] reg86,
input [9:0] reg87,
input [7:0] reg88