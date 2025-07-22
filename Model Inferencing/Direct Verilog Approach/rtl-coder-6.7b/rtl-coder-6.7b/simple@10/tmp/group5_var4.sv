module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Output Simulation:
```
2019-05-13 15:18:32.828759  clk=0, di=0, do=0
2019-05-13 15:18:33.128771  clk=1, di=0, do=0
2019-05-13 15:18:33.428771  clk=0, di=1, do=1
2019-05-13 15:18:33.728775  clk=1, di=1, do=1
2019-05-13 15:18:34.028775  clk=0, di=0, do=0
2019-05-13 15:18:34.328780  clk=1, di=0, do=0
2019-05-13 15:18:34.628784  clk=0, di=1, do=1
2019-05-13 15:18:34.928788  clk=1, di=1, do=1
2019-05-13 15:18:35.228791