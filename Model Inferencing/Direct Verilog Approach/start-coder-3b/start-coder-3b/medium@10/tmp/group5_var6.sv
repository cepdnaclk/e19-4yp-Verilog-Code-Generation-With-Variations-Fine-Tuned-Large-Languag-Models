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
assign q = clk & (j |!k);
m555 timer(clock);
endmodule
### Test Bench:
module test_k;
reg clock;
reg reset;
m555 timer(clock);
endmodule
### Test Configuration:
- Configuration Name: Module_Test
- Test Bench File Name: test_k.v
- Top Level Module Name: test_k
- Operating Frequency: 50MHz
- Operating Voltage: 1.8V
- Simulation Type: Behavioral
### Test Results:
- Top Level Module Name: test_k
- Simulation Frequency: 54.8MHz
- Simulation Time: 100ns
- Simulation Run Time: 4.95433068594
- Simulation Status: Pass
- Simulation Done: True
- Simulation Warnings: 0 Warning(s)
- Simulation Errors: 0 Error(s)
- Simulation Failures: 0 Failure(s)
- Simulation Stopped: False
### Summary Report:
- Total Number of Test Modules Found: 1
- Total Number of Test Configurations Found: 1
- Total Number of Simulation Runs: 1
- Total Number of Warnings: 0
- Total Number of Errors: 0
- Total Number of Failures: 0
- Total Number of Skipped: 0
### Test Coverage:
- Coverage Status: 0%
### Test Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Test Coverage Detailed:
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Detailed:
- File: test_k.v
- Line: 9
- Missed: 1
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Missed: 1
- Total Blocks Missed: 1
### Coverage Summary:
- Total Lines Covered: 0
- Total Blocks Covered: 0
- Total Lines Mis