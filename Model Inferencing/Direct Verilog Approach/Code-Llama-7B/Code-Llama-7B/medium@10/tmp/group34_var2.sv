module gates4_top_2 (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [3:0] x;
gates4 U1
(
.x(x),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
case (0)
switch ( 1'b1, 1'b1, 1'b1, 1'b1)
		x = 4'b1010;
		x = 4'b0101;
		x = 4'b1111;
		x = 4'b1011;
		x = 4'b1101;
		x = 4'b0010;
		x = 4'b0011;
		x = 4'b0111;
		x = 4'b1001;
		x = 4'b1110;
		x = 4'b0100;