```verilog
// Verilog code for Problem 5
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```

This code will now correctly handle multiple bits per signal. It's generally good practice to use `logic` for variables instead of `reg` to ensure compatibility with future Verilog standards. Also, bit widths are properly declared in the output port declaration.