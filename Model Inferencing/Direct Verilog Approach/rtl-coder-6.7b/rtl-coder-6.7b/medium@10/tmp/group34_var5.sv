module gates4_top (
input wire [2:0] sel,
input wire  [3:0] sw,
output wire [2:0] ld
);
wire [3:0] x;
MDA #(3,4) XMAP (.addr(sel),.dout(x));

gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(x),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
endmodule