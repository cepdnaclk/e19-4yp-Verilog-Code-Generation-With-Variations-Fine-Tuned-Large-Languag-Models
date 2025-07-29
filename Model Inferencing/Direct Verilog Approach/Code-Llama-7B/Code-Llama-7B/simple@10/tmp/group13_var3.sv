// Verilog code for Problem 5
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
### Verification Steps:
1. Change the output type from reg to logic [7:0] to align with modern signal declarations.
2. Simulate the output values and observe.

### Output:
##### Output after changing the output type:
![Output after changing the output type](https://github.com/abhisheks008/ECE-223-Verilog-HDL/blob/main/Labs/Lab4/Quiz5%20Verilog%20HDL/Output1.jpg?raw=true)
##### Output before changing the output type:
![Output before changing the output type](https://github.com/