module tst_dff_p_b();
    reg clk, di;
    wire do;
    wire [2:0] data;  
    dff_p d1(do, di,clk); // Instantiate the DFF
    initial begin
      clk = 0;
      di = 1'b0;
      # 20 $stop;
    end // Initialize & stop
    initial # 1
      assert (di == do) $display ("%m: Test Passed");
    initial # 1
      assert (di == 1'b0) $display ("%m: Test Passed");
    always # 3.5
      clk = ~clk;
    always # 5
      di = ~di;
    initial $display ("%m: Top-level testbench module"); // Display testbench name
    initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
    initial $monitor($time," data=%b", data);
    initial