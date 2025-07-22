module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $display("out[1] = %d",out[1]);
  initial $display("out[2:0] = %b",out[2:0]);
  initial $display("out[1:0] = %b",out[1:0]);
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Output:
out[1] = 1
out[2:0] = 000
out[1:0] = 00
1000 in = 0, con = 1, output = 1 
1005 in = 1, con = 1, output = 0 
1010 in = 0, con = 0, output = 0 
1015 in = 1, con = 0, output = 0
1020 $finish: finishing