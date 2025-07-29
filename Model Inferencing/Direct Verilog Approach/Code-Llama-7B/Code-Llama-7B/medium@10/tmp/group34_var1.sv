module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [2:0] x;
wire and4_, or4_, xor4_;
gates4 U1	// Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(x),
.and4_(and4_),
.or4_(or4_),
.xor4_(xor4_)
);
mda U2 // MDA
(
.sw(sw),
.index(3'b100),
.x(x)
);
mux4 U3 
(
.in(x),
.sel(3'b011),
.out(ld)
);
endmodule
### Results: