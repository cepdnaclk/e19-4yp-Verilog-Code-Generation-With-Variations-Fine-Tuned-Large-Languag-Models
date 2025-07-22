module tst_CMOSsw1();
  reg [3:0] in; wire [3:0] out;
  CMOSsw1 cmsw(out,in); // Instantiate CMOS switch
  initial begin in=4'b0; end // Start enabled
  initial begin in[1] = 1'b1; in[3]=1'b1; end // Enable switch
  always #5 in =~in; // Toggle data
  initial $monitor($time, "in = %b, output = %b ",in,out);
  initial #20 $stop; // Stop simulation
endmodule