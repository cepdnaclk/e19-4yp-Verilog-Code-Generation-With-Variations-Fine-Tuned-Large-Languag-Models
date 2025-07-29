module top();
generate
	ttst_ttrimux2_1 u1();
endgenerate
initial begin
	$dumpfile("dump.vcd");
	$dumpvars(1,top);
	$dumpvars(1,u1);
end
initial #1 $monitor("s = ttst_ttrimux2_1::s");
initial #1 $monitor("in1 = ttst_ttrimux2_1::i0");
initial #1 $monitor("in2 = ttst_ttrimux2_1::i1");
initial #1 $monitor("enable = ttst_ttrimux2_1::e");
initial #1 $monitor("sel = ttst_ttrimux2_1::s");
initial #1 $monitor("output = ttst_ttrimux2_1::out");
initial begin
	#50 
	u1.s = 0;
	#50
	u1.s = 1;
	#40 
u1.e