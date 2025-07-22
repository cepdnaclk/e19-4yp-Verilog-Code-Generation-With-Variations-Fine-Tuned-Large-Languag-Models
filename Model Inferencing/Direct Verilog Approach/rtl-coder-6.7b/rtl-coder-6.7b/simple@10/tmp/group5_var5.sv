module tst_dff_pbeh();
  logic clk; logic di; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF
  initial begin clk=1'b0; #35 $stop; end // Initialize & stop
  always #5 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  assign di=clk; // Toggle data
  initial $monitor($time,"clk=%b, di=%b,