module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  reg [1:0] tmp;
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial begin
    tmp = 2;
    assert (tmp[d1.do]) else $error ("d1.do is not a reg");
  end
endmodule
### Output:
### Variable 'd1.do' is not a reg