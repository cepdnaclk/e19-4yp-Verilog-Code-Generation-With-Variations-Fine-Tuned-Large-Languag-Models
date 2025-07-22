module gates4_top #(parameter N = 2) (
input wire [3:0] sw,
output wire [N:0] ld
);
gates4 #(.N(N)) U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(sw),
.and4_(ld[N]),
.or4_(ld[N-1]),
.xor4_(ld[N-2])
);
endmodule