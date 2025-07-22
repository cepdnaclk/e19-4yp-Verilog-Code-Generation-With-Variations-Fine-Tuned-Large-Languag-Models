module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  // Check indexed result against slice range
  initial begin
    assert(cmsw.out[7:4]==4'b0) else
      $error("%0d ns: slice %b out of range",$time, cmsw.out[7:4]);
  end
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule