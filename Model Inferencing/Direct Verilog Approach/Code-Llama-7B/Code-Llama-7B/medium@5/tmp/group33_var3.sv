module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw[4:0]; // Instantiate CMOS switch array
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  final $display("output = %b ",{cmsw[0].out,cmsw[1].out,cmsw[2].out,cmsw[3].out,cmsw[4].out}); // Check if outputs match expected