module Prob_6_7_Dlatch (Detect_Dlatch, D_in, clk, rst);
// D-latch nonresetting sequence detector
output Detect_Dlatch;
input D_in, clk, rst;
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3;
parameter S_5 = 5, S_6 = 6, S_7 = 7;
reg [2: 0] state_Dlatch, next_state;
wire Detect_Dlatch = (((state_Dlatch == S_3)&&(D_in == 0))
|| ((state_Dlatch == S_7)&&(D_in ==1)));
always @ (posedge clk) if (rst) state_Dlatch <= S_0; else state_Dlatch <= next_state;
always @ (state_Dlatch, D_in) begin
case (state_Dlatch)
S_0:  next_state = S_1;
S_1:  next_state = S_2;
S_2:  next_state = S_3;
S_3:  next_state = S_3;
S_5:  next_state = S_6;
S_6:  next_state = S_7;
S_7:  next_state = S_7;
default: next_state = S_0;
endcase
end
endmodule
### Testbench:
module d_latch_tb;
reg clk, rst;
reg [1: 0] Din_tb;
wire [1: 0] Dout_tb;
Prob_6_7_Dlatch Dout_Dlatch (Dout_tb, Din_tb, clk, rst);
always begin
Din_tb = {Din_tb[1],