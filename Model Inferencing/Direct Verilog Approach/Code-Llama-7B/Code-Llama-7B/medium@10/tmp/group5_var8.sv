module test_k4(parameter N = 127);
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk[N:0](q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
for (int i=0