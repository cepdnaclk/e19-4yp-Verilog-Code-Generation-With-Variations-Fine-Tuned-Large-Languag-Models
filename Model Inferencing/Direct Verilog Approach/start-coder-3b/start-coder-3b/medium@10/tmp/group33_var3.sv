module tst_CMOSsw3();
  reg in,con; wire out;
  reg [1:0] data;
  CMOSsw3 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial begin begin
    data[0] = in;
    data[1] = con;
  end // Set initial data
  initial $monitor($time, "in = %b, con = %b, output = %b ",data[0],data[1],out);
  initial #20 $stop; // Stop simulation
endmodule
### Output:
*in = 01 *con = 11 *output = 00
*in = 00 *con = 10 *output = 01
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 11 *output = 00
*in = 00 *con = 10 *output = 01
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
*in = 00 *con = 01 *output = 00
### Base Verilog Code:
module tst_CMOSsw4();
  reg in,con; wire out;
  CMOSsw4 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in