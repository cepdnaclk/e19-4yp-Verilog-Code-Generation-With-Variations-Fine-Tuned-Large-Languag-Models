```
module m555(clk);
input clk;
wire inside_logic[1:2][2:3];
inside_logic[1][2] = 2;
endmodule
```
### Expected Output:
The expected output is an incrementing counter.  If the output is a constant, mda will report an error.
### Actual Output:
```