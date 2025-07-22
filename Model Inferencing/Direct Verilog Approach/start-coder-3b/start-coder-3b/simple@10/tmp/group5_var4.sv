module tst_dff_pbeh();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin
    clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule

### Test Result:

The data is still valid, it just no longer has the path delay requirement on the path to the DFF.

## 	Module Instantiation with Multiple Timing Constraints

### Base Verilog Code:
module tst_dff_pbeh();
  reg di,clk; wire do;
  dff_p d1(do,di