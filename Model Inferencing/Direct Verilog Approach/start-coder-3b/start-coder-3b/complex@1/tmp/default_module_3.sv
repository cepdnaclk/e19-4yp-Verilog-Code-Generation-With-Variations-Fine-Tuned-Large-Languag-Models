package package_prob6;

// Constants used in sequence detector
const int S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
const int S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
endpackage

module Prob_6_7_Moore_Mod (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
reg [3: 0] state_Moore