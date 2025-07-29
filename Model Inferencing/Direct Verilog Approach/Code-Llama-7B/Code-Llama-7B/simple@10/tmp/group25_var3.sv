module mos_strength_test_enum (a, c, zn, zp);
input a, c;
output zn, zp;
//nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
//pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
//replace with enum
nmos_enum (nmos_out, a, c);
pmos_enum (pmos_out, a, c);
//assign to 'zn' and 'zp'
assign zn = nmos_out ^ pmos_out;
assign zp = nmos_out & pmos_out;
endmodule
### Modified Test Code:
test_mos_strength_enum test_mos_strength_enum (inputs, outputs);
inputs = {1'b0, 1'b0};
inputs = {1'b1, 1'b0};
inputs = {1'b0, 1'b1};
inputs = {1'b1, 1'b1};
### Modified Test Bench:
initial begin
		$dumpfile("mos_strength_enum_test.vcd");
		$dumpvars(0, mos_strength);
		// test strength for N-MOS
		inputs = {1'b0, 1'b0}; // should output 0
		@(posedge tb_clk);
		assert (outputs == 1'b0);
		@(posedge tb_clk);
		// test strength for P-MOS
		inputs = {1'b1, 1'b0}; // should output 1
		@(posedge tb_clk);
		assert (outputs == 1'b1);
		@(posedge tb_clk);
		// test strength for N-MOS with complementary input
		inputs = {1'b0, 1'b1}; // should output 1
		@(posedge tb_clk);