```verilog
module tst_genVar2();
  genvar i;
  genvar j;
  and2 and2;
  initial begin
    for (i = 0; i < 2; i=i+1) begin
      for (j = 0; j < 2; j=j+1) begin
        and2.in1 = i[0];
        and2.in2 = j[0];
        and2.out = and2.out;
      end
    end
  end
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b1);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b0, 1'b0, 1'b0);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b0, 1'b0, 1'b1);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b0, 1'b1, 1'b0);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b0, 1'b1, 1'b1);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b1, 1'b0, 1'b0);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b1, 1'b0, 1'b1);
  $monitor($time, "i = %b, j = %b, and2.out = %b", 1'b1, 1'b1, 1'b1);
  generate
    and2 \genblock1; // Instantiate NMOS NOR
  endgenerate
endmodule
```
### Comparison:
The first one is a normal NMOS NOR gate simulation block, the second one uses inside operator to generate NMOS NOR gate simulations.
![](./genvar2.png)

The original NMOS NOR gate simulation block was