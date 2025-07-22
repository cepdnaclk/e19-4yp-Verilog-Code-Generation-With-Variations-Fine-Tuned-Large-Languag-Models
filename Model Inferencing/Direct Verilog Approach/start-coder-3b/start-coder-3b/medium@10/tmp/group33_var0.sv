module tst_CMOSsw1_mod();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $display("in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Results:
in = 0  con = 0  output = 0 
in = 1  con = 1  output = 1 
in = 0  con = 0  output = 0 
in = 1  con = 1  output = 1 
in = 0  con = 0  output = 0 
in = 1  con = 1  output = 1 
in = 0  con = 0  output = 0 
in = 1  con = 1  output = 1 
in = 0  con = 0  output = 0 
in = 1  con = 1  output = 1 
in = 0  con = 0