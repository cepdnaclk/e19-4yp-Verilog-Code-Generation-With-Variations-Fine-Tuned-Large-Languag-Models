parameter N=32;
module tst_CMOSsw1();
  reg [N-1:0] in; reg con; wire [N-1:0] out;
  CMOSsw1 #(.N(N)) cmsw(out,in,con); // Instantiate CMOS switch
  initial begin
    // Initialization of array
    in=0; con=0;
  end
  always #5 in[0]=~in[0];
  always #3 con=~con;
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop;
endmodule