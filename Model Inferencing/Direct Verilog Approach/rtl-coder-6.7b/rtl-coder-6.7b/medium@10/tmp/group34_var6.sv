module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
assign y[2] = and4_(x[2]);
assign y[1] = or4_(x[1]);
assign y[0] = xor4_(x[0]);
endmodule