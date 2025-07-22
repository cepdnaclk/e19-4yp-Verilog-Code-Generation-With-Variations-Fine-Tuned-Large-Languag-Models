module fourbit_counter(q,q_clk,Q);
output [3:0] q,Q;
input [3:0] q_clk;
initial begin
function [3:0]