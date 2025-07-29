module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[3:0](out[1:0],in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "