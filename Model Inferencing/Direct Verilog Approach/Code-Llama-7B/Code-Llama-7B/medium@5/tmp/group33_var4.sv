module tst_cmos_sw1_4();
  reg in,con;wire out;
  reg [3:0] arr[10];
  initial begin
    arr[0] = 4'b0001; arr[1] = 4'b1000; arr[2] = 4'b1100; arr[3] = 4'b1110; arr[4] = 4'b0111;
     arr[5] = 4'b0100; arr[6] = 4'b1100; arr[7] = 4'b1010; arr[8] = 4'b0111; arr[9] = 4'b0010;
  end
  CMOSsw1 #(.n(4)) cmsw(out,in,con);
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control