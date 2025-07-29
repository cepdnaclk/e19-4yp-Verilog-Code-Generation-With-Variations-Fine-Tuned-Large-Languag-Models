module tst_CMOSsw1();
  reg in,con; wire out;
  reg [1:0] arr [2:0];
  initial begin in=1'b0; con=1'b1; arr[1]='h0; arr[2]='h0; arr[0]='h0; end
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  always @(posedge con) begin arr[1][0:1]='h1; arr[1][3:4]='h0; end
  always @(posedge in) begin arr[2][0:1]='h0; arr[2][3:4]='h1; end
  CMOSsw