module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
wire [3:0] Base_code;
assign Base_code = BCD_in + 3;
assign Excess_3_out = Base_code[2:0];
endmodule
module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
wire Excess_3_code;
generate
	wire HiCount_code[0:3];
	assign Excess_3_code = BCD_in inside {3, HiCount_code};
	assign HiCount_code = {1, 2, 3, 4};
endgenerate
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
endmodule
### Notes:
- 3'sd4 is not synthesizable.
- In SystemVerilog, the same thing can be done with the following 2 lines of code:
	`wire HiCount_code = 3;`
	`wire Excess_3_code = BCD_in inside {3, HiCount_code};`
	Because when the compiler sees it, it is equivalent to the following code:
	`wire [0:3] HiCount_code = 3;`
	`wire [0:3] Excess_3_code = BCD_in inside {3, HiCount_code[0:3]};`

### Base Verilog Code:
module tdc_comp (input_tdc, input_ref, input_fst_cap, input_snd_cap, input_thrd_cap, output_fst_cap, output_snd_cap, output_thrd_cap);
input input_tdc, input_ref, input_fst_cap, input_snd_cap, input_thrd_cap;
output output