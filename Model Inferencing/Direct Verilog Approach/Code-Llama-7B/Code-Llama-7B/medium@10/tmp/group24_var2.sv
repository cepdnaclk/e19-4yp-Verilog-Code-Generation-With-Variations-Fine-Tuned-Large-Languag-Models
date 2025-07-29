module tst_dff_p_b();
  reg clk; wire do;
  dff_p d1(do,1'b0,clk); // Instantiate the DFF
  initial begin clk=0; #500 $stop; end // Initialize & stop
  assign do =