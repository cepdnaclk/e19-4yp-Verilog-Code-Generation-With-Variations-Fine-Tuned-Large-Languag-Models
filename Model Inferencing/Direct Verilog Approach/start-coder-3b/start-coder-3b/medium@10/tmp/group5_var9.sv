[cpp]
### Original Verilog Code:
module test_mux;
output a, b;
input sel;
assign a = sel? b : a;
assign b = sel?