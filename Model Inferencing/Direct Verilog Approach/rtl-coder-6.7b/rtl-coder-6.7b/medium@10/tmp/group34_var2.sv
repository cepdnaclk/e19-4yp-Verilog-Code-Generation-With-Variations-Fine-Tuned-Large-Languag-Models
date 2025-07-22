module gates4_MDA_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 (
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);

logic [9:0] index_mda;
assign index_mda = ((sw[3]&sw[1])<<5)|(sw[3]<<4)|(sw[2]<<3)|(sw[1]<<2)|sw[0];
case (index_mda)
	10'b00_000_00000: ld[0] = (sw[0]&sw[1])|sw[2];
	10'b00_000_00001: ld[0] = sw[1]&~sw[0];
	10'b00_000_00010: ld[0] = sw[1]&sw[2];
	10'b00_000_00011: ld[0] = sw[2];
	10'b00_000_00100: ld[0] = sw[0]&sw[1];
	10'b00_000_00101: ld[0] = sw[0]&sw[2];
	10'b00_000_00110: ld[0] = sw[0];
	10'b00_000_00111: ld[0] = sw[0]&sw[1]|sw[2];
	10'b00_000_01000: ld[0] = sw[0]&sw[1]|sw[2];
	10'b00_000_01001: ld[0] = sw[0]&sw[1];
	10'b00_000_010