module Prob_8_Pis (Pis, clk, rst);
// Pis
output Pis;
input clk, rst;
reg [2: 0] counter_state;
wire [2: 0] counter_state_next;
reg [10: 0] counter_load_latch;
wire [10: 0] counter_load_latch_next;
reg [10: 0] counter_compare_latch;
wire [10: 0] counter_compare_latch_next;
reg [10: 0] counter_load_load;
reg [10: 0] counter_load_compare;
reg counter_load_load_enable;
reg counter_load_compare_enable;
// Pis Logic
always @ (posedge clk) begin
counter_state_next = counter_state;
case (counter_state)
Pis: begin
if (rst) counter_state_next = 0;
else if (counter_load_load_enable)
counter_state_next