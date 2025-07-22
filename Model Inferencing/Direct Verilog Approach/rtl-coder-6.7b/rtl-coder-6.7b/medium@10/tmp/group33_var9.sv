module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  reg [10:0] arr[0:4]; // Declare and initialize array
  initial begin in=1'b0; con=1'b1; end
  always #5 in =~in; #5 in =~in;
  always #3 con=~con;
  initial begin arr[0]='b1010_101010; arr[1]='b1111_111111; arr[2]='b1111_000000; end
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  always @ (in or con)
    if(arr[2][4:0] == out[4:0])
      $display("in == arr[2][4:0]"); else $warning("in!= arr[2][4:0]");
  initial begin #20 $stop; end
endmodule
### Output:
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 1, output = 0
15 ps in = 0, con = 1, output = 0
15 ps in = 1, con = 0, output = 1
15 ps in = 0, con = 1, output = 0
15 ps in = 1