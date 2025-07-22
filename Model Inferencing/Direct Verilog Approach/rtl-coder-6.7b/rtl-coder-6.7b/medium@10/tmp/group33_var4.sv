```
module tst_CMOSsw1();
  reg in,con; wire out[4:0];
  CMOSsw1 cmsw[4:0](out,in,con);
  initial begin in=1'b0;con=1'b1;end
  always #5 in =~in;