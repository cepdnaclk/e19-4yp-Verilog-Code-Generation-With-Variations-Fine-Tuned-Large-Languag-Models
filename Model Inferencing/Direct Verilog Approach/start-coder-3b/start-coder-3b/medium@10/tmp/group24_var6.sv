module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial begin $display ("%m: Bottom-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial begin $display ("%m: Top-level testbench, second module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, third module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, third module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);

  initial begin $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, fourth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Top-level testbench, sixth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, sixth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, sixth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $display ("%m: Bottom-level testbench, sixth module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  initial $monitor($time," clk=%b, di=%b, do=%