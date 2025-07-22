module latch (input d, c, output reg q, q_b );
reg [7:0] q;
output reg q_b;
always begin
wait ( c );
end
endmodule
### Verilog-2005 Test File:
latch:
	d 0 0
	d 1 1
	d 0 1
	test_passed