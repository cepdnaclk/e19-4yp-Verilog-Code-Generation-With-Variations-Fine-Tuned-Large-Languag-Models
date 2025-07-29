module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
reg [3:0] mda;
initial begin
ld = 0;
end
always @(*) begin
case (mda)
4'd1: ld = and4_(ld[2]), or4_(ld[1]), xor4_(ld[0]);
4'd2: ld = and4_(ld[1]), or4_(ld[0]), xor4_(ld[2]);
4'd3: ld = and4_(ld[0]), or4_(ld[2]), xor4_(ld[1]);
4'd4: ld = and4_(ld[1]), or4_(ld