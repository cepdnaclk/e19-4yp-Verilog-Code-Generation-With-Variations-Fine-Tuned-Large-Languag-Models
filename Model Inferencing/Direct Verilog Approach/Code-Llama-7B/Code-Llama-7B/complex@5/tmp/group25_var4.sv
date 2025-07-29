```
module adder_4bit(BCD_in, Adjr, Output);
input [3:0] BCD_in;
input [3:0] Adjr;
output [3:0] Output;
assign Output = BCD_in + Adjr;
endmodule

module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
wire [3:0] HiCount;
reg [3:0] Adjr;
wire [3:0] Output;
adder_4bit M0(BCD_in, Adjr, Output);
assign Excess_3_out = Output;
always @(BCD_in)
begin
HiCount[0] = BCD_in[0] | BCD_in[1] | BCD_in[2];
HiCount[1] = BCD_in[1] | BCD_in[2] | BCD_in[3];
HiCount[2] = BCD_in[2] | BCD_in[3];
HiCount[3] = BCD_in[3];
end
genvar i; generate 
for (i=0; i<4; i=i+1)
begin: Excess_3
if (~BCD_in[i])
begin: Excess_3_2
if (~HiCount[i])
assign Adjr[i] = 1'b0;
else
assign Adjr[i] = BCD_in[i] + 1'b1;
end else begin: Excess_3_20
if (HiCount[i])
assign Adjr[i] = 4'b1110;
else
assign Adjr[i] = BCD_in[i];
end end end end
endgenerate
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b