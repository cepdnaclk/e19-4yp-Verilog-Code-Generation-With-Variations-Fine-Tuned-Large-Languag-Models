module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jkFF[2:0](q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Final Code:
module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk[0:2](q, clock, j, k, preset, clear);
initial
begin
reset_ff;
j = 1;
k = 0;
end
m555 timer(clock);
endmodule
### Test Cases
![alt text](JK_FF_2D_array_inlined_passing.png)
### Passed Results
![alt text](JK_FF_2D_array_inlined_passing.png)
### Failed Results
![alt text](JK_FF_2D_array_inlined_failing.png)
### Non-Functional Test Case
![alt text](JK_FF_2D_array_inlined_nonfunctional.png)
### Passed: 1.000
### Failed: 0.000
### Aborted: 0.000
### Pass_Tolerance: 0.020
### Fail_Tolerance: 0.000
### Not_Run: 0.000
### Total: 1.000
### MDA: 6.000
### Coverage: 75.00%
### MDA/Coverage: 50.00%
### MD/C: 50.00%
### MDA_Coverage: 33.33%
### MDA_MD_C: 5.56%
### Coverage_MD_C: 66.67%
### Summary:
2