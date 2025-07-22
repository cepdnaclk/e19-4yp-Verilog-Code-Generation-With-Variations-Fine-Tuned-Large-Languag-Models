module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  integer i,j;
  initial begin
    for (i=0;i<10;i=i+1) begin
      j=i; // Function-call result as array index.
      $monitor($time," clk=%b, di=%b, do=%b, i=%d, j=%d",clk,di,do,i,j);
    end
  end
endmodule