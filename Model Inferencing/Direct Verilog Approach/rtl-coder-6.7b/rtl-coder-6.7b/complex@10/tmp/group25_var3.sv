module comparator (A, B, HiCount, AGTB);
input [3:0] A, B;
input [3:0] HiCount;
output AGTB;
wire AGTB;
wire [3:0] Hi;

generate

for (genvar i=0; i<4; i=i+1) begin :HiCounts
assign Hi[i] = A[i] & B[i];
end : HiCounts

endgenerate

assign AGTB = HiCount[3] | ((HiCount[2] & Hi[3]) | (HiCount[1] & Hi[2] & Hi[3]) | (HiCount[0] & Hi[1] & Hi[2] & Hi[3]));

endmodule

### Previous Solution:
module comparator (A, B, HiCount, AGTB);
input [3:0] A, B;
input [3:0] HiCount;
output AGTB;
wire AGTB;
wire [3:0] Hi;

for (genvar i=0; i<4; i=i+1) begin :HiCounts
assign Hi[i] = A[i] & B[i];
end : HiCounts

assign AGTB = HiCount[3] | ((HiCount[2] & Hi[3]) | (HiCount[1] & Hi[2] & Hi[3]) | (HiCount[0] & Hi[1] & Hi[2] & Hi[3]));

endmodule

### Module:
module t_comparator ();
reg [3:0] A, B;
reg [3:0] HiCount;
wire AGTB;

comparator M0 (A, B, HiCount, AGTB);
initial
$monitor($time,,"A = %b, B = %b, HiCount = %b, AGTB = %b", A, B, HiCount, AGTB);
initial begin
A = 0;
B = 1;
HiCount = 4;
#1;
A = 0;
B = 1;
HiCount = 3;
#1;
A = 0;
B = 1;
HiCount = 2;