module dff_p(out,in,clk); // Instantiate the DFF
  input in;
  output out;
  reg do;
  reg di;
  initial begin di=1'b0; $monitor($time, "clk=%b, di=%b",clk,di); end
  always @(posedge clk) begin
    out = do;
    do <= in;
    $display ("%m: Register do=%b", do);
    $display ("%m: New value of di=%b", di);
  end
endmodule
```

## Example 9
> Modification of output format for procedural-assign & initial/always block

```
### Base Verilog Code:
module dff_p(out,in,clk); // Instantiate the DFF
  input in;
  output out;
  reg do;
  initial begin di=1'b0; $monitor($time, "clk=%b, di=%b",clk,di); end
  always @(posedge clk) begin