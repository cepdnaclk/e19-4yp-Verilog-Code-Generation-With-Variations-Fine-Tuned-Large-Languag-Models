module Problem1(input [3:0] a, b, output [3:0] sum);
  logic di, clk;
  logic [3:0] sum_out;
  always @(posedge clk)
    sum <= sum_out;
  assign sum_out = a + b;
  assign clk = di;
endmodule
### Testbench:
module Testbench;
    reg [3:0] a, b;
    wire [3:0] sum;
    Problem1 problem1 (a, b, sum);
    initial
        begin
            $dumpfile("dump.vcd");
            $dumpvars(0, problem1);
            a = 3'b0001; b = 3'b0001;
            #5 di = 1'b1;
            #5 di = 1'b0;
        end
endmodule
### Result:
![Image result](https://github.com/xulanlou/Digital-System-Design---Fall2019/tree/master/Lab%2013/images/Exercise1.png)
### Questions:
### 1. How did you test your verilog code?
I used Verilog to compile and compile my testbench to check my verilog code
### 2. What is the output of the code?
The output is 2'b01, which means the sum is 0001 + 0001 which is 0010.
### 3. What is the reason for the problem?
After I changed the reg declarations to logic, the code stopped working as expected, which means I'm not allowed to use reg declarations in systemverilog codes.
### 4. What should you do to fix the problem?
I should use the reg data type, and also use the initial and always blocks to control my codes.
### Exercise 2:
Implement the following code in system verilog.
Verilog Code:
module Problem2(input [3:0] a, b, output [3:0] sum);
    reg clk, di;
    reg [3:0] sum_out;
    assign