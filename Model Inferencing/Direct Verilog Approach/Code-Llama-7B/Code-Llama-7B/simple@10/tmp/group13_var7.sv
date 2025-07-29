```
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
### Example of Synthesized Code
```
module Half_Adder(
    input A, B,
    output logic [7:0] Sum, Carry
);
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
```
### TestBench of the above module
```
module Half_Adder_tb();
    logic A, B, Carry, Sum;
    Half_Adder UUT(.A(A),.B(B),.Carry(Carry),.Sum(Sum));
    initial begin
        A = 0; B = 0;
        #10 A = 0; B = 1;
        #10 A = 1; B = 0;
        #10 A = 1; B = 1;
        #10 A