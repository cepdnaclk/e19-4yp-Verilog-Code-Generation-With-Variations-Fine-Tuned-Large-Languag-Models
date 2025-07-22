module Clock_Prog (clock, Resetn);
input clock, Resetn;

reg clock;

always
	begin
	clock = 1; #5;
	clock = 0; #5;
	end

endmodule
### Test Input:
module t_Clock_Prog ();
wire clock;

initial 
begin
	Clock_Prog M1 (clk, rst);
	initial 
	begin
	$monitor ($time, ": Clock Value=%b rst=%b", clk, rst);
	rst = 0;
	#20;
	rst = 1;
	#100;
	$finish;
	end
end

endmodule