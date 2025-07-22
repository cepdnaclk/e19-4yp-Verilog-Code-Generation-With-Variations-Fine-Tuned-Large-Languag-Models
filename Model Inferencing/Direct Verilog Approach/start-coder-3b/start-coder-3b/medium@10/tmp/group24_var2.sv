module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial ${@1:35:35,5,'b0}; // variation instruction
endmodule
/README.md## Description
This repository is used to store Verilog testbenches.
## Differences between different files
1. The first file contains an example of a basic test bench.
2. The second file contains an example of a test bench with an internal clock.
3. The third file contains an example of a test bench with a variation instruction.
4. The fourth file contains an example of a test bench with a multi-clock instruction.
5. The fifth file contains an example of a test bench with a multiple-timing instruction.
## Differences between modified files
1. The first file is modified by changing the name of the file from `tst_p_b.sv` to `tst_dff_p_b.sv`.
2. The second file is modified by adding a clock signal (`clk`) inside the module.
3. The third file is modified by adding a variation instruction (`#35 $stop`) inside the initial block.
4. The fourth file is modified by adding a multi-clock instruction (`$fork`).
5. The fifth file is modified by adding multiple-timing instructions (`$timescale`)./tst_p_b.sv@@ -1,10 +1,10 @@
-module tst_p_b();
+module tst_dff_p_b();
   reg di,clk; wire do;
   dff_p d1(do,di,clk); // Instantiate the DFF
   initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
   always #3 clk=~clk; // Generate clock
   always #5 di=~di; // Toggle data
   initial $display ("%m: Top-level testbench module"); // Display testbench name
   initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
 endmodule
 /tst_dff_p_b.sv@@ -1,10 +1,10 @@
-module tst_p_b();
+module tst_dff_p_b();
   reg di,clk; wire do;
   dff_p d1(do,di,clk); // Instantiate the DFF
   initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
   always #3 clk=~clk; // Generate clock
   always #5 di=~di; // Toggle data
   initial $display ("%m: Top-level testbench module"); // Display testbench name
   initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
   initial $display ("%m: Variation testbench module"); // Display testbench name
   initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);/README.md@@ -11,2 +11,4 @@
 1. The first file is modified by changing the name of the file from `tst_p_b.sv` to `tst_dff_p_b.sv`.
 2. The second file is modified by adding a clock signal (`clk`) inside the module.
 3. The third file is modified by adding a variation instruction (`#35 $stop`) inside the initial block.
+4. The fourth file is modified by adding a multi-clock instruction and a variation instruction (`$fork` and `#35 $stop`, respectively).
+5. The fifth file is modified by adding multiple-timing instructions (`$timescale`).
username_0: Thanks for checking out the repository. I have updated the README file. Please merge the request.598138665createdusername_0closedTrue