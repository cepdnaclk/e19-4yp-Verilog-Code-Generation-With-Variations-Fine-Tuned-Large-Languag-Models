module tst_CMOSsw3();
  reg in,con; wire out;
  CMOSsw3 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin
    in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Testbench File:
module tst_CMOSsw3();
  reg in,con; wire out;
  CMOSsw3 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin
    in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Results:
in = 1, con = 0, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1'b0 
in = 0, con = 0, output = 1'b1 
in = 0, con = 1, output = 1