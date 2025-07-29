module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin 
    clk=0; di=1'b0; #35 $stop; 
    $display("%m: Top-level testbench module"); // Display testbench name
    $monitor("$time,clk=%b