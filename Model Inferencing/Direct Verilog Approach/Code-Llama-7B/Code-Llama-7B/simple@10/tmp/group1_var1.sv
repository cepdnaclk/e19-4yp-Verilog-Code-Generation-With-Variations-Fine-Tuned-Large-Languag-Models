```verilog
module AND_Gate(
    input [1:0] A [0:3] [1:0],
    output [1:0] Y [0:3] [1:0]
);
    assign Y = A & B;
endmodule
```
### Testbench Code:
```verilog
module AND_Gate_test;
    logic [1:0] A [0:3] [1:0], B [0:3] [1:0