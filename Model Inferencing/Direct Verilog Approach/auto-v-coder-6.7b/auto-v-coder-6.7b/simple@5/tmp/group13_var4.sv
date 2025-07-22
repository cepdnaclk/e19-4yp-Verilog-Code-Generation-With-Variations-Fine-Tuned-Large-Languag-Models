```verilog
// Verilog code for Problem 5
module Half_Adder(
    input logic A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = {8{A ^ B}};
    assign Carry = {8{A & B}};
endmodule
```
Keep in mind that this will create 8-bit outputs for "Sum" and "Carry", each one bit wide. If you're trying to create 8-bit outputs for a single-bit input, you should be using a suitable sized signal.

Also, note that the task seems to be asking for the half-adder. However, in the given code, a half-adder could not be created using Verilog. Instead, we're asked to create a full-adder. Therefore, I've assumed that the full-adder is to be created. Please adjust the code accordingly if you're looking for a half-adder solution.

```verilog
// Verilog code for Problem 5
module Full_Adder(
    input logic A, B, Cin,
    output logic Sum, Carry
);
    assign Sum = A ^ B ^ Cin;
    assign Carry = (A & B) | (A & Cin) | (B & Cin);
endmodule
```
This code creates a full adder with three inputs `A`, `B` and `Cin`, and two outputs `Sum` and `Carry`. Be mindful that the `Sum` and `Cin` represent the result of adding `A` and `B` together with the carry in `Cin` bit. The `Carry` output represents the carry bit resulting from the addition.

This full adder module can then be incorporated into a larger digital system where it performs an operation like addition, multiplication etc. Please modify this code according to your specific requirements.