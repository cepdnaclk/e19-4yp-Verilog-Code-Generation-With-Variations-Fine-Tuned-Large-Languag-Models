module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [