module XOR_Gate(
    input logic [1:0] A [0:3], B [0:3],
    output logic Y [0:3]
);
    assign Y = A ^ B;
endmodule
### Testbench:
```
module testbench;
    logic [1:0] A [0:3], B [0:3];
    logic Y [0:3];
    XOR_Gate gate_0 (
       .A(A),.B(B),.Y