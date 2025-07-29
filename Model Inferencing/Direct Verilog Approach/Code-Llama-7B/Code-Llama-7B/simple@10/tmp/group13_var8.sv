``` Verilog
module Half_Adder(
    input A, B,
    logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
### Signals, Variables and Constants:
In Verilog, signal names are of the form `input|output|inout|wire` `Name`.

``` Verilog
// Input signal:
input A;
// Output signal:
output Sum;
```
`reg` type (or `wire`) must be declared first.

``` Verilog
// Signal declaration:
reg Sum, Carry;
```

### Instantiation
It also serves as a way to refer to module instances.

``` Verilog
// Instantiation:
Half_Adder U1(
   .A(A),.B(B),
   .Sum(Sum),.Carry(Carry)
);
```
### Assigning Signals

``` Verilog
assign Sum = A ^ B;
assign Carry = A & B;
```
To drive a `wire` from a module, the `assign` keyword must be used.

### Output Synchronism
In Verilog, `output` signals are driven by the values at the positive edge of the clock.

``` Verilog
assign Sum = A ^ B;
assign Carry = A & B;

endmodule
```
To synchronize the output, we put the signal assignment at the positive edge of the clock.

``` Verilog
always @(posedge clk) begin
    Sum = A ^ B;
    Carry = A & B;
end
```
### Full Code
``` Verilog
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    always @(posedge clk) begin
        Sum = A ^ B;
        Carry = A & B;
    end
endmodule

module Half_Adder16(
    input A, B,
    output logic [15:0] Sum, Carry
);
    Half_Adder HalfAdder16_1(
       .A(A