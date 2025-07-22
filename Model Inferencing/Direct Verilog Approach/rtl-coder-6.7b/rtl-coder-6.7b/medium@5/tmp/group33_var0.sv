```verilog
module tst_CMOSsw1_Vary();
  // Register test variables
  reg in,con;
  // Define outputs array
  wire [7:0] outs [0:7];
  // Instantiate CMOS switch
  CMOSsw1 cmsw(outs[0],in,con);

  initial begin in=1'b0; con=1'b1; end // Start enabled

  // Always block
  always #5 in =~in;