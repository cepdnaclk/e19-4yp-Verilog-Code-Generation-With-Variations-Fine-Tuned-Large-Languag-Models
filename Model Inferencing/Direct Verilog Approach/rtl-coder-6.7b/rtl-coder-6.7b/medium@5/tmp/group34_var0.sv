module selt4_top (
input wire [3:0] sel,
input wire [1:0] x,
output wire [1:0] y
);
selt4 U1 (
.sel(sel),
.x(x),
.y(y)
);

## 2.24.4.3 - Variation 2: 4-bit selector with 16-bit index¶

### Base Verilog Code:

module selt4_top (
input wire [3:0] sel,
input wire [1:0] x,
output wire wire [1:0] y
);
selt4 U1 (
.sel(sel),
.x(x),
.y(y)
);