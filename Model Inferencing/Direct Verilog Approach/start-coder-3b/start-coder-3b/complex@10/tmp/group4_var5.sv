```systemverilog
module tst_ctr_wt;
reg clk, En;
reg [3:0] N;
wire [3:0] a;
ctr_wt c1 (a,clk,