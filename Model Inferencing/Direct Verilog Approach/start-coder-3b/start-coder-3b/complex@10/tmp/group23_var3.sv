```verilog
module mux(
input [7:0] in0,
input [7:0] in1,
input [7:0] in2,
input [1:0] sel,
output reg [7:0] out
);
generate

mux inst_muxA(
.in0(in0),
.in1(in1),
.in2(in2),
.sel(sel),
.out(out)
);