module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end
  always_comb begin in =~in; // Toggle data
  always_comb begin con=~con; // Toggle control
  end
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Result:
in = 0xf0, con = 0x00, output = 0x0f

##

## Original Code
module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con