```

Now we will add the input clocks to the `clock_enable` module:

```
### The Original Clock Tree:
module clock_tree(clk_en,clock_out);
  input clock_in;
  wire clock_out;
  wire clk_en;

  always @(posedge clock_in) clk_