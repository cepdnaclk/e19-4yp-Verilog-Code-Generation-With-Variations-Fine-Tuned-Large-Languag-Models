module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [3:0] tmp;
tmp = sw[0]? {3'b0,sw[1:2]} : sw;

gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(tmp),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
endmodule

## Code

### Original Code (Verilog)

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
endmodule

### New Code (Verilog)

module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
wire [3:0] tmp;
tmp = sw[0]? {3'b0,sw[1:2]} : sw;

gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs from input 'x'
(
.x(tmp),
.and4_(ld[2]),
.or4_(ld[1]),
.xor4_(ld[0])
);
endmodule