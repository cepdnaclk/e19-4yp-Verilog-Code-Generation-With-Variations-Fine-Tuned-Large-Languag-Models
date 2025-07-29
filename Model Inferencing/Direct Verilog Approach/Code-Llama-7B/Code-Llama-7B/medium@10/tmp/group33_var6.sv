module tst_CMOSsw2();
  reg in,con; wire out;
  reg [15:0] my_array[2];
  my_array[0][1:0] = "00" ;
  my_array[0][4:3] = "10" ;
  my_array[0][7:6] = "01" ;
  my_array[0][9:8] = "11" ;
  my_array[1][1:0] = "01" ;
  my_array[1][4:3] = "11" ;
  my_array[1][7:6] = "00" ;
  my_array[1][9:8] = "10" ;
  

  CMOSsw2 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Original Instruction:
Use inside in final block to check if function call result indexed into an array matches a slice range.
### Base Verilog Code:
module tst_CMOSsw4();
  reg in,con; wire out;
  CMOSsw4 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
### Variation Instruction:
Use inside in final block to check if function call result indexed into an array matches a slice range.