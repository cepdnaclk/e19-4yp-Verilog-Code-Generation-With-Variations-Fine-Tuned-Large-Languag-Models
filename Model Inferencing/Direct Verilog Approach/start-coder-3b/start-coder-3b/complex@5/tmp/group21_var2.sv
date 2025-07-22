module Prob_6_10_Mealy (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8, S_9 = 9;
parameter S_10 = 10, S_11 = 11, S_12 = 12, S_13 = 13;
reg [2: 0] state_Mealy, next_state;
wire Detect_Mealy = (((state_Mealy == S_