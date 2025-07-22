//`timescale 1ns/100ps
module comparator(HiCount, Adjr);
input [3:0] HiCount;
output reg [1:0] Adjr;
wire [10:0] HiCount_Array;
assign HiCount_Array[0] = 0;
assign HiCount_Array[1] = (HiCount == 0);
generate
assign HiCount_Array[2] = (HiCount == 0) | (HiCount == 1);
assign HiCount_Array[3] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2);
assign HiCount_Array[4] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3);
assign HiCount_Array[5] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (HiCount == 4);
assign HiCount_Array[6] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (HiCount == 4) | (HiCount == 5);
endgenerate
assign HiCount_Array[7] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (HiCount == 4) | (HiCount == 5) | (HiCount == 6);
assign HiCount_Array[8] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (HiCount == 4) | (HiCount == 5) | (HiCount == 6) | (HiCount == 7);
assign HiCount_Array[9] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (HiCount == 4) | (HiCount == 5) | (HiCount == 6) | (HiCount == 7) | (HiCount == 8);
assign HiCount_Array[10] = (HiCount == 0) | (HiCount == 1) | (HiCount == 2) | (HiCount == 3) | (