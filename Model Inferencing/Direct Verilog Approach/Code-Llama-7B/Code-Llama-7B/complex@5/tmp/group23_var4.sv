module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
generate
	reg [3:0] rr_ir;
	initial begin
		rr_ir = 4'b0;
		if( rr_ir == 4'b1001 ) $display("%d", 1);
	end
endgenerate
endmodule
### Reference Code:
```
module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s_cnt;
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
reg [3:0] rr_ir;
initial begin
	rr_ir = 4'b0;
	if( rr_ir == 4'b1001 ) $display("%d", 1);
end
endmodule
```
### Test Case:
```
module tb;
wire [3:0] d_in;
wire clk;
wire sr;
wire sl;
wire ld;
wire [1:0] s_cnt;
wire rst;
wire [3:0] q;
initial begin
	clk = 0;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b00;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b00;
	sr = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sr = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sr = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sr = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;
	sl = 1;
	#1
	clk = 1;
	#1
	clk = 0;
	s_cnt = 2'b10;