```verilog
`include "defines.v"

module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ao, ai;
  wire [0:0] ao, ai;
  not #2 (ao,ai);
endmodule

module test_aa();
  wire [0:0]	a, b, y, z;
  show_aa	ao (z,a);
  show_aa	bo (y,b);

  initial
    begin
	$display("Test: default packed enum value");
	$display("a=0, b=0 => y=1");
	a = 0; b = 0;
	#10;
	$display("z=%b, y=%b", z, y);
 
	$display("Test: non-default packed enum value");
	$display("a=0, b=1 => y=0");
	a = 0; b = 1;
	#10;