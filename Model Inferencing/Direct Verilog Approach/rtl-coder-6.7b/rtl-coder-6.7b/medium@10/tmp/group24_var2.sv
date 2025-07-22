module tst_dff_p_c();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial begin
  automatic int i;
  for (i=0;i<=10;i++)
  begin 
  automatic int j;
  for (j=0;j<=5;j++)
  begin
  $display($time," clk=%b, di=%b, do=%b",clk,di,do);
  end
  end
  end
  endmodule // tst_dff_p_c