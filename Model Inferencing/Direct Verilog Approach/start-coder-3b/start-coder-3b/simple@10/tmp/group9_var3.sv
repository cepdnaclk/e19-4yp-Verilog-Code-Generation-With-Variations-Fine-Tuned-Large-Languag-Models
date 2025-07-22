```verilog
module Problem4(input [3:0] a, b, output [3:0] diff);
  reg [3:0] x, y, z;
  assign diff = a - b;
endmodule
```
## Problem 5
### Base Verilog Code:
```