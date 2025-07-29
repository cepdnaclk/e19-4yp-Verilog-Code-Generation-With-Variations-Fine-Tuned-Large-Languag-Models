module tst_dff_p_b();
  reg di,clk; wire [3:0] do;
  dff_p d1(do[0],di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do[0:0]);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do[1:1]);
  initial $monitor($time," clk