module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
initial
begin
reset_ff;
logic [2**7-1:0] my_array;
j = my_array[7'b1000101];
k = 0;
end
m555 timer(clock);
endmodule
### Expected Result:
### Result:
### Test Case ID: