module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Test Bench
module test_k_testbench;
timeunit 1ns;
timeprecision 1ns;
reg reset;
reg clock;
wire q;

test_k mod(q, clock, reset);
initial
begin
reset = 1'b1;
clock = 1'b1;
wait 100ns;
reset = 1'b0;
end
always
begin
#50