```
parameter DATA_WIDTH = 16;
```

## Problem 8
### Base Verilog Code:
```
module tb_TOP1;
  reg CLK, RST_X;
  TOP1 uut(.CLK(CLK),.RST_X(RST_X));

  initial begin
    CLK = 0