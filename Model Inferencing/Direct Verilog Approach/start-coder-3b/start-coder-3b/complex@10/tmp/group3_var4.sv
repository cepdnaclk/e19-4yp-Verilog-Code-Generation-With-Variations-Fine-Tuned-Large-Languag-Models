module Prob_6_7_Moore (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
next_state = S_0;
case (state_Moore)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = (state_Moore inside {S_4,S_8});
S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in) next_state = S_8; else if (D_in == 0) next_state = S_7;
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
default: next_state = S_0;
endcase
end
endmodule

## Prob_6_8

### Base Verilog Code:
module Prob_6_8 (Detect_Moore, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Moore;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
parameter S_9 = 9, S_10 = 10, S_11 = 11, S_12 = 12, S_13 = 13;
parameter S_14 = 14, S_15 = 15, S_16 = 16, S_17 = 17, S_18 = 18;
parameter S_19 = 19, S_20 = 20, S_21 = 21, S_22 = 22, S_23 = 23;
parameter S_24 = 24, S_25 = 25, S_26 = 26, S_27 = 27, S_28 = 28, S_29 = 29;
parameter S_30 = 30, S_31 = 31, S_32 = 32, S_33 = 33, S_34 = 34;
parameter S_35 = 35, S_36 = 36, S_37 = 37, S_38 = 38, S_39 = 39;

reg [3: 0] state_Moore, next_state;
wire Detect_Moore = ((state_Moore == S_17) || (state_Moore == S_22) || (state_Moore == S_27) || (state_Moore == S_32) || (state_Moore == S_37));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (state_Moore, D_in) begin
next_state = S_0;
case (state_Moore)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_5;
S_2: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_5;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_4;
S_4: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_7: if (D_in) next_state = S_8; else if (D_in == 0) next_state = S_7;
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_9: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_10: if (D_in) next_state = S_11; else if (D_in == 0) next_state = S_10;
S_11: if (D_in) next_state = S_11; else if (D_in == 0) next_state = S_12;
S_12: if (D_in) next_state = S_11; else if (D_in == 0) next_state = S_13;
S_13: if (D_in) next_state = S_11; else if (D_in == 0) next_state = S_14;
S_14: if (D_in) next_state = S_15; else if (D_in == 0) next_state = S_14;
S_15: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_16: if (D_in) next_state = S_20; else if (D_in == 0) next_state = S_16;
S_17: if (D_in) next_state = S_20; else if (D_in == 0) next_state = S_18;
S_18: if (D_in) next_state = S_21; else if (D_in == 0) next_state = S_18;
S_19: if (D_in) next_state = S_21; else if (D_in == 0) next_state = S_20;
S_20: if (D_in) next_state = S_16; else if (D_in == 0) next_state = S_25;
S_21: if (D_in) next_state = S_16; else if (D_in == 0) next_state = S_25;
S_22: if (D_in) next_state = S_23; else