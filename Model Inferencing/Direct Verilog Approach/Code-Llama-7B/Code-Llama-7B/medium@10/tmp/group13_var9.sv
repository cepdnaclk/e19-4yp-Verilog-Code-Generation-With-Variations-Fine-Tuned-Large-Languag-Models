module tst_wand1; //testbench
reg i1,i2;
wire o; // Added wire declaration
wand1 ww(i1,i2,o);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial $monitor($time,"i1=%b,i2=%b,o=%b",i1,i2,o);
initial #8 $stop; // Added stop
endmodule
### Test Plan:
* Design is a Wand gate.
* Both input drivers are pull down.
* Output should be pull down.
### Expected Result:
* Output should be driven low by both the inputs.
### Pass/Fail Criteria:
* Pass - Output is pulled down.
* Fail - Output is not pulled down.

### Note:
No change to the original design.

### Original Code
<pre>
module wand1 (i1, i2, o);
	input i1, i2;
	output o;

	assign o = i1 & i2;
endmodule

module tb_wand1 ();

	reg i1, i2;
	wire o;
	wand1 wand1_inst (i1, i2, o);

	initial begin
		i1=0;
		i2=0;
		#100
		$stop;
	end

endmodule
</pre>
### Modified Code
<pre>
module wand1 (i1, i2, o);
	input i1, i2;
	output o;

	assign o = i1 & i2;
endmodule

module tb_wand1 ();

	reg i1, i2;
	wire o;
	wand1 wand1_inst (i1, i2, o);

	initial begin
		i1=0;
		i2=0;
		#100
		$stop;
	end

endmodule
</pre>
### Original CDC Testbench
<pre>
`timescale 1ns / 1ps

module tst_wand_cdc;
	parameter CYCLES = 5000;
	
	reg i1, i2, i3;
	wire o;
	wand_cdc u_wand_cdc(.i1(i1),.i2(i2),.i3(i3),.o(o));
	
	initial begin
		$monitor("%0t i1=%b i2=%b i3=%b o=%b", $time, i1, i2, i3, o);
		for(int i=0; i<CYCLES; i++) begin
			i1 = $urandom_range(0, 1);
			i2 = $urandom_range(0, 1);
			i3 = $urandom_range(0, 1);
			#5;
		end
		#100;
		$stop;
	end

endmodule

module wand_cdc (i1, i2, i3, o);
	input i1, i2, i3;
	output o;
	
	assign o = i1 & i2 & i3;
endmodule
</pre>
### Modified CDC Testbench
<pre>
`timescale 1ns / 1ps

module tst_wand_cdc;
	parameter CYCLES = 5000;
	
	reg i1, i2, i3;
	wire o;
	wand_cdc u_wand_cdc(.i1(i1),.i2(i2),.i3(i3),.o(o));
	
	initial begin
		$monitor("%0t i1=%b i2=%b i3=%b o=%b", $time, i1, i2, i3, o);
		for(int i=0; i<CYCLES; i++) begin
			i1 = $urandom_range(0, 1);
			i2 = $urandom_range(0, 1);
			i3