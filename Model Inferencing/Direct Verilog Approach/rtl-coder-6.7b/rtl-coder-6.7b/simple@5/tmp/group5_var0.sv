module tst_dff_pbeh();
  logic di,clk; logic do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Outputs:
- `$time` : 0, clk=b1, di=b0, do=b0
- `$time` : 3, clk=b1, di=b1, do=b0
- `$time` : 6, clk=b0, di=b1, do=b0
- `$time` : 9, clk=b1, di=b0, do=b0
- `$time` : 12, clk=b0, di=b1, do=b0
- `$time` : 15, clk=b1, di=b1, do=b0
- `$time` : 18, clk=b0, di=b0, do=b0
- `$time` : 21, clk=b1, di=b1, do=b0
- `$time` : 24, clk=b0, di=b0, do=b0
- `$time` : 27, clk=b1, di=b1, do=b0
- `$time` : 30, clk=b0, di=b1, do=b0
- `$time` : 33, clk=b1, di=b0, do=b0
- `$time` : 36, clk=b0, di=b1, do=b0
- `$time` : 39, clk=b1, di=b1, do=b0
- `$time` : 42, clk=b0, di=b0, do=b0
- `$time` : 45, clk=b1, di=b1, do=b0
- `$time` : 48, clk=b0, di=b0, do=b0
- `$time` : 51, clk=b1, di=b1, do=b0
- `$time` : 54, clk=b0, di=b1, do=b0
- `$time` : 57, clk=b1, di=b0, do=b0
- `$time` : 60, clk=b0, di=b1, do=b0
- `$time` : 63, clk=b1, di=b1, do=b0
### Testbench Code:
module tst_dff_pbeh();
  logic di,clk; logic do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule