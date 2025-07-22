```
module adder4(a, b, c, S, f);
input a, b, c;
input [3:0] S;
output f;
reg f;
wire S1;
always @(*)
    S1 = S;
    f = a + b + c + S1;
endmodule
```
### Testbench File:
```
`timescale 1ns