module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
reg [1:0] r [0:3];
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
always @(*)
begin
 if (jk.q & jk.q_next)
 r[0] = r[0] + 1;
end
endmodule