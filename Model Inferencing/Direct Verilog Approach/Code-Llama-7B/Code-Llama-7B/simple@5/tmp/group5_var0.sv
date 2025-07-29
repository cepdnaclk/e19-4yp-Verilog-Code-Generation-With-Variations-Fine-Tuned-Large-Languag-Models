module tst_dff_pbeh();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin