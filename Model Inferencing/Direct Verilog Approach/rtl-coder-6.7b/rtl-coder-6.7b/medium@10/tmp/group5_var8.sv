module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0][0] = 1;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Tested Code:
module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0].[0] = 1;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Tested Code:
module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0][0] = 1;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Tested Code:
module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0][0] = 1;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Tested Code:
module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0][0] = 1;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Tested Code:
module test_k;
wire q, clock, j, k, preset, clear;
assign jk.jk[0][0] = 1;
jkEdgeFF jk(q