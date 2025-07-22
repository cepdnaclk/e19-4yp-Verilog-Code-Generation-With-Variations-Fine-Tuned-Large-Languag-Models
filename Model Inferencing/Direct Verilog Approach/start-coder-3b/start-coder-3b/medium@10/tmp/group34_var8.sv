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

### Base Verilog Code:
module gates4_top (
input wire [3:0] sw,
output wire [2:0] ld
);
gates4 U1 // Assuming 'gates4' provides and4_, or4_, xor4_ outputs