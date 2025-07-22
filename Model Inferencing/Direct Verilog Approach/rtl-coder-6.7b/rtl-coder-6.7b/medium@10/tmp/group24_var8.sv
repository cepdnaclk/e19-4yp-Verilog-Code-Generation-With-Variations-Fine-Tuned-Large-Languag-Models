module dff_p(output reg q,input d,input clk);
  always @(posedge clk) q <= d; // DFF with D Flip-Flop Syntax
  initial $display ("%m: Design module"); // Display module name
endmodule
module tst_dff_p_b();
  reg di,clk; wire do; wire [$bits({do})-1:0] a;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial a = {do};
endmodule