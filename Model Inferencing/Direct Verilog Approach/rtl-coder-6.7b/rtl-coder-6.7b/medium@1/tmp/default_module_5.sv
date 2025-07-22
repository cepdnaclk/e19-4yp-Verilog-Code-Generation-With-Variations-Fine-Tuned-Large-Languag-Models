module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
constant_array[100][100] = 6;
end
m555 timer(clock);
endmodule
### Constraints
###### Clock
* clock frequency: 1 KHz
* clock period: 1000ps
* clock transition: 500ps
###### JK Flip Flops
* inputs: j (positive edge), k (positive edge)
* clear: 0 (negative edge)
* preset: 0 (negative edge)
###### m555 Timer
* input: clock
* output: clock
### Expected Results
* In the simulation, the output should follow the jk flip flop input j and k.