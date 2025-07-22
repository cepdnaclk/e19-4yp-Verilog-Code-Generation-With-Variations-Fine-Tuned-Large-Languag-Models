reg signed [7:0] a_input,b_input;
	wire signed [7:0] result1,result2;
	wire [7:0] result_unsigned;
	sw2led2 sw2led (sw,result_unsigned);
	ALU32 alu (.a_input(a_input),.b_input(b_input),.result_unsigned(result_unsigned),.result_signed(result_signed) );
	initial begin
		#200 a_input = -6;
		#200 b_input = -5;
		#200 op = 2'b00; 
		#200 op = 2'b01;
		#200 $finish;
	end
	always #200 op = op + 2'b1;
	always #100 a_input = a_input + 2;
	always #100 b_input = b_input + 2;