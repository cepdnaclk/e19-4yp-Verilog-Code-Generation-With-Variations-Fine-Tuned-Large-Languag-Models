module tst_dff_p_d();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always @(posedge clk) di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
endmodule
### Simulation:
![](dff_p_d.png)
### Simulation-Errors:
No errors;
### Verilog Code:
module tst_dff_p_e();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always @(posedge clk) do=~do; // Toggle data