```verilog
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```

This code declares a module named `Half_Adder` that takes two inputs, A and B, and two outputs, Sum and Carry. For the Sum, it uses the XOR operation (`^`) to combine the two inputs. For the Carry, it uses the AND operation (`&`) to find the carry-out bit. Note the change in the output data type from `reg` to `logic [7:0]`.

This code should now be compatible with modern Verilog designs. It aligns with the common signal declaration style used in modern Verilog simulations and synthesis tools. Note that the output type is 8-bit wide (`[7:0]`) to match the number of bits in the inputs.

Remember to use this modified code in the context of your specific design, test the functionality thoroughly after the implementation.