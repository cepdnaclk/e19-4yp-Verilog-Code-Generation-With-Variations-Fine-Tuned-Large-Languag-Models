module Prob_6_10_Moore_FallingEdge (Detect_Falling_Edge, D_in, clk, rst);
// Moore nonresetting sequence detector
output Detect_Falling_Edge;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [3: 0] state_Moore, next_state;

// Moore resetting counter
// reg [7: 0] count_Moore = 0;
// wire Detect_Moore = ((state_Moore == S_0) && (D_in == 0));
wire Detect_Moore = ((state_Moore == S_4) || (state_Moore == S_8));
always @ (posedge clk) if (rst) state_Moore <= S_0; else state_Moore <= next_state;
always @ (D_in) begin
next_