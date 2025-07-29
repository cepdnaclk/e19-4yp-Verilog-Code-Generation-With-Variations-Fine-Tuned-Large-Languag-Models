module test_k;
wire q, clock, j, k, preset, clear;
reg [11:0] arr [1:0];
reg j, k;
jkEdgeFF jk(q