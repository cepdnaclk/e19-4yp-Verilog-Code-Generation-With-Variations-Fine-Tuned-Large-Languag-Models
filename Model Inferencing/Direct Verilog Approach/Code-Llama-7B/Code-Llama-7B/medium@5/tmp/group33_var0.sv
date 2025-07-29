module tst_CMOSsw1();
  reg in,con; wire out;
  wire [3:0] oa;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  always @(in or con) oa[3:0] <= (3'b1001*in+1'b0*con); // Store function result in array
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time,