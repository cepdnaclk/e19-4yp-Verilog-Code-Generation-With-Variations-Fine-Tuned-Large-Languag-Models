module Prob_7_Seq (Detect_Seq, D_in, clk, rst);
// Sequence detector
output Detect_Seq;
input D_in, clk, rst;
// Sequence states, placed in package scope
parameter S_0 = 0, S_1 = 1, S_2 = 2, S_3 = 3, S_4 = 4;
parameter S_5 = 5, S_6 = 6, S_7 = 7, S_8 = 8;
reg [3: 0] state_Seq, next_state;
// Sequence detection logic
reg [1: 0] seq_cnt;
seq_cnt <= 0;
Detect_Seq <= ((state_Seq == S_4) || inside(state_Seq, {S_4, S_8}));
always @ (posedge clk) if (rst) state_Seq <= S_0; else state_Seq <= next_state;
always @ (state_Seq, D_in) begin
next_state = S_0;
case (state_Seq)
S_0: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_5;
S_1: if (D_in) next_state = S_1; else if (D_in == 0) seq_cnt <= 2'b01;
S_2: if (D_in) next_state = S_2; else if (D_in == 0) next_state = S_3;
S_3: if (D_in) next_state = S_3; else if (D_in == 0) seq_cnt <= 2'b10;
S_4: if (D_in) next_state = S_3; else if (D_in == 0) next_state = S_3;
S_5: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_6: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
S_7: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_7;
S_8: if (D_in) next_state = S_1; else if (D_in == 0) next_state = S_6;
default: next_state = S_0;
endcase
if (seq_cnt == 2'b01) seq_cnt <= 2'b11; else if (seq_cnt == 2'b10) seq_cnt <= 2'b10; else if (seq_cnt == 2'b11) seq_cnt <= 2'b00;
end
endmodule

## Problem 8

### Base Verilog Code:
module Prob_8_Seq (Detect_Seq, D_in, clk, rst);
// Sequence detector
output Detect_Seq;
input D_in, clk,