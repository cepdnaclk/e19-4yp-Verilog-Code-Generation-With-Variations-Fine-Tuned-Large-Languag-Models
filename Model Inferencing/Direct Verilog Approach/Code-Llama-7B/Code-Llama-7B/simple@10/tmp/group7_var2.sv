module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Variation Info:
The purpose of the verification is to demonstrate the usage of SystemVerilog bit type instead of wire type.
### Result Expectation:
No error due to use of SystemVerilog bit type.
### Correct Output:
No output
### Error Output:
No output
### Runtime Error:
No runtime error
### Compilation Error:
No compilation error
### Running Time:
150ms
### Expected Running Time:
150ms
### Code Optimization:
No optimization
### Code Complexity:
No complexity
### Code Design:
No design
### Requirements:
1. Verilog code written in files verilog_code_1.v and verilog_code_1.v.
2. Testbench written in file testbench_1.sv.
3. A batch script file named create_x