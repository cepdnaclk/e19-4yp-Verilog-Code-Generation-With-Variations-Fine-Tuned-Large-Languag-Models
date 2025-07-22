module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
logic [1:0] array [3:0][3:0];
array[0][0] = 1;
array[0][1] = 1;
array[0][2] = 1;
array[0][3] = 1;
array[1][0] = 1;
array[1][1] = 1;
array[1][2] = 1;
array[1][3] = 1;
array[2][0] = 1;
array[2][1] = 1;
array[2][2] = 1;
array[2][3] = 1;
array[3][0] = 1;
array[3][1] = 1;
array[3][2] = 1;
array[3][3] = 1;
end
m555 timer(clock);
endmodule
### Verilog Code:
module jkEdgeFF(q, clock, j, k, preset, clear);
output reg q;
input clock;
input j, k, preset, clear;
reg q;
always @(posedge clock)
begin
if (preset) q <= 1;
else if (clear) q <= 0;
else
begin
if((j==1) && (k==1)) q <= ~q;
else if (j==1) q <= 1;
else if (k==1) q <= 0;
end
end
endmodule
### Input Simulation File:
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
### Verification File:
assert property($rose(j) ##1 $rose(q));
assert property($rose(k) ##1