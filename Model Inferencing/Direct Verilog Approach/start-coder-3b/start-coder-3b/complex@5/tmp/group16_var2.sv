```verilog
package comparator;
  logic [10:0] x;
  logic y;

  always_comb begin
    y = x << {10'b0000000000};
  end
endpackage
```
### Expected Output:
```verilog
initial begin
  y = x << {10'b0000000000};
end
```

<br />

### Base Verilog Code:
module tb_TOP1;
  reg CLK, RST_X;
  TOP1 uut