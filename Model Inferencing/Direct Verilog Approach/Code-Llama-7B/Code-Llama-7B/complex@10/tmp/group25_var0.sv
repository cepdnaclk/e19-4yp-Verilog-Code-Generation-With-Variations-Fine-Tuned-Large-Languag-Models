```
module encoder #(parameter NumIn = 4) (BCD_in, Excess_3_out);
input [NumIn-1:0] BCD_in;
output reg [NumIn-1:0] Excess_3_out;
reg [4:0] Adjr;
reg [4:0] HiCount [3:0];
always @(*) begin
integer i;
for(i = 0; i < 4; i = i + 1) begin
  if(BCD_in[i] == 1'b1) begin
    Adjr = i;
  end
end
for(i = 0; i < 4; i = i + 1) begin
  HiCount[i] = {BCD_in[i], BCD_in[i] & BCD_in[i+1], BCD_in[i] & BCD_in[i+1] & BCD_in[i+2], BCD_in[i] & BCD_in[i+1] & BCD_in[i+2] & BCD_in[i+3]};
end
end
generate
if(NumIn == 4) begin
  always @(*) begin
    case(Adjr)
      0: Excess_3_out = {HiCount[0] + HiCount[1] + HiCount[2] + HiCount[3], BCD_in[3], BCD_in[2], BCD_in[1]};
      1: Excess_3_out = {HiCount[1] + HiCount[2] + HiCount[3], BCD_in[3], BCD_in[2], BCD_in[1], BCD_in[0]};
      2: Excess_3_out = {HiCount[2] + HiCount[3], BCD_in[3], BCD_in[2], BCD_in[1], BCD_in[0]};
      3: Excess_3_out = {HiCount[3], BCD_in[3], BCD_in[2], BCD_in[1], BCD_in[0]};
      default: Excess_3_out =