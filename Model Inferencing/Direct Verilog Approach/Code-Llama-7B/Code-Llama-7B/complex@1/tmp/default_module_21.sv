module Prob_6_7_Mealy_Inside (Detect_Mealy, D_in, clk, rst);
// Mealy nonresetting sequence detector
output Detect_Mealy;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [2: 0] state_Mealy, next_state;
wire Detect_Mealy = (((state_Mealy == S_3)&&inside({|D_in}, {$D_in[0], $D_in[0+:2]}))
|| ((state_Mealy == S_7)&&inside(D_in, {$D_in[0], $D_in[0+:2]})));
always @ (posedge clk) if (rst) state_Mealy <= S_0; else state_Mealy <= next_state;
always @ (state_Mealy, D_in) begin
next_state = S_0;
case (state_Mealy)
S_0: if (inside(D_in, {$D_in[0], $D_in[0+:2]})) next_state = S_1; else if (inside({|D_in}, {$D_in[0], $D_in[0+:2]})) next_state = S_5;
S_1: if (inside(D_in, {$D_in[0], $D_in[0+:2]})) next_state = S_2; else if (inside({|D_in}, {$D_in[0], $D_in[0+:2]})) next_state = S_5;
S_2: if (inside(D_in, {$D_in[0], $D_in[0+:2]})) next_state = S_3; else if (inside({|D_in}, {$D_in[0], $D_in[0+:2]})) next_state = S_5;
S_3: if (inside(D_