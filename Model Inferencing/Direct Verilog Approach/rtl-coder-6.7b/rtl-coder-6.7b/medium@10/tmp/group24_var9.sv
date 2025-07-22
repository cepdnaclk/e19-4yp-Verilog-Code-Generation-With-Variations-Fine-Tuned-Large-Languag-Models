module dff_p (output reg q,input rst,din,clk);
  always @(posedge clk)
    if (!rst) q <= din;
    else q <= din[0];
endmodule
module tst_dff_p_b();
  reg di,clk,rst; wire do;
  assign rst = di[0];
  dff_p d1(do,di,clk,rst); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule

### Top-level testbench module:
module tst_dff_p_c();
  reg di,clk,rst;
  wire do;
  assign rst = di[0];
  dff_p d1(do,di,clk,rst); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Testbench Output:
tst_dff_p_c: Top-level testbench module
20 clk=0, di=0, do=0
23 clk=1, di=0, do=0
26 clk=0, di=1, do=0
29 clk=1, di=1, do=1
32 clk=0, di=0, do