```verilog
module Half_Adder(
    input logic [7:0] A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
This modification allows the module to handle data types of up to 8 bits, instead of just one bit. The logic [7:0] declarations are used for handling multiple bits in a single statement. Verilog allows for a more compact and flexible way of handling arrays and vectors.
It's important to remember to update your input and output port declarations accordingly when modifying this code. The input and output ports have been changed to match the new logic [7:0] type for 8-bit operations.