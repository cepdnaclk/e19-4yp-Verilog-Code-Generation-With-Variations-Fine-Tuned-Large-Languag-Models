module Problem1(input [3:0] a, b, output [3:0] sum);
  logic [3:0] di, clk;
  assign di = a + b;
  assign clk = di;
endmodule
### Expected Output:
Test Passed
### Actual Output:
Test Passed
### Version:
1.0
### Created/Modified on:
10-27-2020
### Created/Modified by:
Lukas Herman
### Problem Description:

* Change the reg declarations for di and clk to logic to test compatibility with SystemVerilog types.

### Instructions to Run:
* Navigate to the root directory of the repository.
* Navigate to "Chapter 3/Problem 1"
* Compile the code using the command "verilog Problem1.v". (Note: verilator works too)

### Cleanup/Reset Instructions:
N/A

### Tested