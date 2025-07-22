module Prob_6_10_D_with_D (D_out, D_in, clk, rst);
output D_out;
input D_in, clk, rst;
reg [1: 0] D_data;
always @ (posedge clk) if