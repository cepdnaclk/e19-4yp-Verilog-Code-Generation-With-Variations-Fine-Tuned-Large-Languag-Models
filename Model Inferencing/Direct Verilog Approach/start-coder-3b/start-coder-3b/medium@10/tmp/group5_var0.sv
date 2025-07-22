module test_k;
wire q, clock, j, k, preset, clear;
reg j, k;
jkEdgeFF jk(q, clock, j, k, preset, clear);
logic [0:1] jk_table [0:2] [0:1];

initial
begin
reset_ff;
j = 1;
k = 0;
end

jk_table [0] [0] = 0;
jk_table [0] [1] = 1;
jk_table [1] [0] = 1;
jk_table [1] [1] = 0;
m555 timer(clock);
jkEdgeFF jk(q, clock, j, k, preset, clear);
$display("jk_table[0][0]: %x, jk_table[0][1]: %x, jk_table[1][0]: %x, jk_table[1][1]: %x", jk_table[0][0], jk_table[0][1], jk_table[1][0], jk_table[1][1]); endmodule ### Test Case: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Expected o/p: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Result: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Test Results: #### Test Results: 1) PASSED 2) PASSED 3) PASSED 4) PASSED 5) PASSED 6) PASSED 7) PASSED 8) PASSED 9) PASSED 10) PASSED 11) PASSED 12) PASSED 13) PASSED 14) PASSED 15) PASSED #### Test Summary: Test Cases: 15, Failures: 0 #### DETAILED TEST SUMMARY: test_k.sv: 1) PASSED test_k.v: 5) PASSED test_k.v: 11) PASSED ##### Summary: 1) PASSED 2) PASSED 3) PASSED 4) PASSED 5) PASSED 6) PASSED 7) PASSED 8) PASSED 9) PASSED 10) PASSED 11) PASSED 12) PASSED 13) PASSED 14) PASSED 15) PASSED ### Verification: #### Command: iverilog -o test_k.vvp -D DEBUG -s test_k test_k.sv $ verilator -cc test_k.sv -O3 --exe timer.cpp --top-module test_k
$make -f Vtest_k.mk test_k_TEST_TOP test_k_TEST_TOP_VVP test_k_TEST_TOP_VVP ###### Results: 1) PASSED 2) PASSED 3) PASSED 4) PASSED 5) PASSED 6) PASSED 7) PASSED 8) PASSED 9) PASSED 10) PASSED 11) PASSED 12) PASSED 13) PASSED 14) PASSED 15) PASSED ### Test Case: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Expected o/p: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Result: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Test Case: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Expected o/p: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Result: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10 8) 01 11 9) 10 00 10) 10 01 11) 10 10 12) 10 11 13) 11 00 14) 11 01 15) 11 10 ### Test Case: 1) 00 00 2) 00 01 3) 00 10 4) 00 11 5) 01 00 6) 01 01 7) 01 10