```
module tst_dff_pbeh();
  logic di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
```
The change is just the use of logic instead of reg to make the module fully compatible with SystemVerilog. Now, di and clk can be used with both 1-bit and 1-bit vectors. This can be useful in cases where we are working with SystemVerilog. ### Note: Not all simulators support SystemVerilog constructs, so this code might not work with some specific simulators. In those cases, using the original base Verilog code should work fine.􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀􏰀