module encoder (BCD_in, HiCount, Excess_3_out);
input [3:0] BCD_in, HiCount;
output [3:0] Excess_3_out;

reg [3:0] Excess_3_out;
// Generate 4x2 array of Excess-3 codes.
integer i;
integer j;
integer k;
integer l;
integer Excess_3_code[4][2] = {{2,3},{5,6},{0,1},{7,4}};

always @(posedge HiCount) begin
Excess_3_out = Excess_3_code[j][k];
end

always@(posedge HiCount) begin
#0;
end
endmodule

module t_encoder();
reg [3:0] BCD_in;
reg [3:0] HiCount_ref;
wire [3:0] Excess_3_out;
wire [3:0] BCD_out;

initial
$monitor("HiCount = %0b", HiCount_ref);
encoder M0(BCD_in, HiCount_ref, Excess_3_out);
initial begin
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);
$monitor($time,,"H = %0b", HiCount_ref);
end

always@(HiCount_ref) begin
### HiCount_ref is the actualHiCount value.### HiCount value is 0 in 1st 4 cycles, 1 in 2nd 4 cycles, and 14 in 4th cycle.
if (HiCount_ref ==14) HiCount_ref = 0;