module gates4_top (
input wire [2:0] sw,
output wire [2:0] ld
);
reg [3:0] x;
wire [2:0] and4_, or4_, xor4_;
gates4 U1
(
.x(x),
.and4_(and4_),
.or4_(or4_),
.xor4_(xor4_)
);
reg [3:0] op;
always @(sw) begin
op = 4'b0001;
case (sw)
1'b0 : op = 4'b0011;
1'b1 : op = 4'b1100;
1'b10 : op = 4'b1110;
1'b100 : op = 4'b0101;
1'b101 : op = 4'b1010;
1'b11 : op = 4'b1001