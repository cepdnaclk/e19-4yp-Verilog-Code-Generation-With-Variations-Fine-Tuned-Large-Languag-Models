```verilog
// Verilog code for Problem 5
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
This Verilog code will now output 8-bit logic values, not just single bits. This change adheres to modern coding styles and is necessary for larger projects.