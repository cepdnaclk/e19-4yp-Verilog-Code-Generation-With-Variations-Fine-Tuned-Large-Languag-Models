module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
always @(j, k) a[j * k][j * k] <= 1'b1;
2d