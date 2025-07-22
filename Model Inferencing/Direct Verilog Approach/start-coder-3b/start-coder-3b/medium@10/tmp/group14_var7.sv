module mux21b (
input [1:0] sel,
input [7:0] a,
input [7:0] b,
input [7:0] c,
input [7:0] d,
output reg [7:0] y
);
always @(*)
case(sel)
4'b0000: y = a;
4'b0001: y = b;
4'b0010: y = c;
4'b0011: y = d;
default: y = 4'b0000;
endcase
endmodule
```

Example 9
----------

```
### Base Verilog Code:
module mux21b (
input wire a,
input wire b,
input wire c,
input wire d,
input wire s,
output reg y
);
always @(*):
if (s == 0) y = a;
else if (s == 1) y = b;
else if (s == 2) y = c;
else if (s == 3) y = d;
endmodule
### Variation Instruction:
Add a priority case