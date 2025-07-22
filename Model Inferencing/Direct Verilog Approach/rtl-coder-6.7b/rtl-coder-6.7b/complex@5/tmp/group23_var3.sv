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
endmodule

generate
initial begin
if ( insided == 1 )
$display( "d_in value %b", rr.ir );
end
endgenerate
end

### Variation Testbench:
`timescale 1ns/100ps

module tb;
wire [3:0] d_in;
wire clk;
wire sr;
wire sl;
wire ld;
wire rst;
wire [1:0] s_cnt;
wire [3:0] q;
wire [3:0] int_q;

initial begin
d_in = 4'b1011;
clk = 1'b0;
sr = 1'b0;
sl = 1'b0;
ld = 1'b0;
rst = 1'b0;
s_cnt = 2'b01;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#2
d_in = 4'b1111;
clk = 1'b1;
sr = 1'b1;
sl = 1'b1;
ld = 1'b1;
rst = 1'b1;
s_cnt = 2'b01;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#4
d_in = 4'b0000;
clk = 1'b0;
sr = 1'b0;
sl = 1'b0;
ld = 1'b0;
rst = 1'b0;
s_cnt = 2'b00;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#6
d_in = 4'b0101;
clk = 1'b1;
sr = 1'b0;
sl = 1'b0;
ld = 1'b0;
rst = 1'b0;
s_cnt = 2'b10;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#8
d_in = 4'b1111;
clk = 1'b0;
sr = 1'b1;
sl = 1'b1;
ld = 1'b1;
rst = 1'b1;
s_cnt = 2'b10;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#10
d_in = 4'b0101;
clk = 1'b1;
sr = 1'b1;
sl = 1'b1;
ld = 1'b0;
rst = 1'b0;
s_cnt = 2'b01;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#12
d_in = 4'b1010;
clk = 1'b0;
sr = 1'b0;
sl = 1'b0;
ld = 1'b0;
rst = 1'b0;
s_cnt = 2'b10;
q = 4'b0000;
int_q = 4'b0000;
end

initial begin
#14
d_in = 4'b0011;
clk = 1'b1;
sr = 1'b1;
sl = 1'b1;
ld = 1'b1;
rst = 1'b1;
s_cnt = 2'b01;
q = 4'b0000;
int_q = 4'b0000;
end


shift_reg (.d_in(d_in),.clk(clk),.sr(sr),.sl(sl),.ld(ld),.rst(rst),
.s_cnt(s_cnt),.q(q),.int_q(int_q) );

endmodule
### Variation Output:
[INFO] 168 : 61 : Verilog HDL : Verilog HDL.
[INFO] 168 : 5547 : Verilog HDL : Verilog HDL.
[INFO] 168 : 9586 : Verilog HDL : Verilog HDL.
[INFO] 168 : 13741 : Verilog HDL : Verilog HDL.
[INFO] 168 : 17915 : Verilog HDL : Verilog HDL.
[INFO] 168 : 22112 : Verilog HDL : Verilog HDL.
[INFO] 168 : 26754 : Verilog HDL : Verilog HDL.
[INFO] 168 : 31210 : Verilog HDL : Verilog HDL.
[INFO] 168 : 36220 : Verilog HDL : Verilog HDL.
[INFO] 168 : 41341 : Verilog HDL : Verilog HDL.
[INFO] 168 : 46650 : Verilog HDL : Verilog HDL.
[INFO] 168 : 52129 : Verilog HDL : Verilog HDL.
[INFO] 168 : 57358 : Verilog HDL : Verilog HDL.
[INFO] 168 : 62974 : Verilog HDL : Verilog HDL.
[INFO] 168 : 69537 : Verilog HDL : Verilog HDL.
[INFO] 168 : 76144 : Verilog HDL : Verilog HDL.
[INFO] 168 : 82497 : Verilog HDL : Verilog HDL.
[INFO] 168 : 88878 : Verilog HDL : Verilog HDL.
[INFO] 168 : 95199 : Verilog HDL : Verilog HDL.
[INFO] 168 : 101557 : Verilog HDL : Verilog HDL.
[INFO] 168 : 107937 : Verilog HDL : Verilog HDL.
[INFO] 168 : 114335 : Verilog HDL : Verilog HDL.
[INFO] 168 : 120752 : Verilog HDL : Verilog HDL.
[INFO] 168 : 127189 : Verilog HDL : Verilog HDL.
[INFO] 168 : 133645 : Verilog HDL : Verilog HDL.
[INFO] 168 : 140122 : Verilog HDL : Verilog HDL.
[INFO] 168 : 146619 : Verilog HDL : Verilog HDL.
[INFO] 168 : 153138 : Verilog HDL : Verilog HDL.
[INFO] 168 : 159678 : Verilog HDL : Verilog HDL.
[INFO] 168 : 166240 : Verilog HDL : Verilog HDL.
[INFO