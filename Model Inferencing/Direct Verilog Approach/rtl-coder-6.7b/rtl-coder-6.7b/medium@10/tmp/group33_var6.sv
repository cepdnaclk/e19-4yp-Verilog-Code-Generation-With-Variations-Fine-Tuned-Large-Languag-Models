module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con);
  initial begin in=1'b0; con=1'b1; end
  always #5 in =~in;
  always #3 con=~con;
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop;
endmodule