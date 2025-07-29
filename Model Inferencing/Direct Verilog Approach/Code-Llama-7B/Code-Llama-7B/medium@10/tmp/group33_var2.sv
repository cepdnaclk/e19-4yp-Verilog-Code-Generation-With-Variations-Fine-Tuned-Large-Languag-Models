module tst_CMOSsw2();
  reg in[3:0],con; wire out;
  CMOSsw2 cmsw[5:7](out,in,con); // Instantiate CMOS switch
  initial begin in=4'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Simulation Log:
    in = 0000, con = 1, output = 0000
    in = 0001