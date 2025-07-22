module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Output:
```
0.000000clk=b0, di=b0, do=b0
6.000000clk=b1, di=b0, do=b0
12.000000clk=b0, di=b0, do=b0
18.000000clk=b1, di=b0, do=b0
24.000000clk=b0, di=b1, do=b1
30.000000clk=b1, di=b1, do=b1
36.000000clk=b0, di=b1, do=b1
```