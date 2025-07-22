module tst_dff_pbeh();
  parameter time td = 10ns;
  logic di,clk; logic do;
  initial begin clk=1; di=1'b0; #10; clk=0; di=1'b1; end
  // #10; clk=1; di=1'b0;
  dff_p #(.td(td)) d1(do,di,clk); // Instantiate DFF with path delay
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
  always #td begin
    $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
  end
  initial #100 $stop;
endmodule
### Summary:
This code uses a for loop to verify the behavior of the DFF for a range