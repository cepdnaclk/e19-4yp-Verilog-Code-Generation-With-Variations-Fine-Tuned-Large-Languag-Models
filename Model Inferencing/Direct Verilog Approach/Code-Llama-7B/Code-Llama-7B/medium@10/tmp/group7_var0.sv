module testcase(
	// Inputs
	input		clk,
	input		rst,
	input		sel,
	// Outputs
	output reg	out1,
	output reg	out2
);
	// Control and assign modules
	control_assign uu1(sel, out1, out2);
	initial begin
		if(!(out1 | out2)) begin
			out1 = 0;
			out2 =