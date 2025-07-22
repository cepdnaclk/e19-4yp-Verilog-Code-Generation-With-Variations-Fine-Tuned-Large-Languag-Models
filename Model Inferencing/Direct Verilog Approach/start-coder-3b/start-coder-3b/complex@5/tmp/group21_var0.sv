module prob_6_9_D_Latch (D_out, di,clk, rst);
// D-latch
// inside check
output D_out;
input di,clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [2: 0] state_D, next_state;
always @ (posedge clk