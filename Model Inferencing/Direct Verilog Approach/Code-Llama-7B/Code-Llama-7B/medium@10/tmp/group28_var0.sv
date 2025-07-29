module aobeh(o,a,b); // Structural AOI
output o;
input[1:0]a,b;
wire a1,b1; // Outputs of AND gates
and g1(a1,a[1],a[0]), g2(b1,b[1],b[0]);
// Structural NOR gate using primitive and packed vector slice
not g3(o,a1,b1); // o = ~(a1 || b1);
// Combinational MUX sensitive to NOR output
always@*
o[0] = a[0]*b[0]*g3[0] + a[0]*b[1]*g3[1] +
      a[1]*b[0]*g3[0] + a[1]*b[1]*g3[1];
o[1] = a[1]*b[1]*g3[1];
endmodule
### Unmodified Verilog Code:
module noteh (o,a,b); // Structural NOT & MUX
output o;
input[1:0]a,b;
wire not_a, not_b;
not g1(not_a,a), g2(not_b,b);
// Mux sensitive to NOT outputs
always@*
o = a[0]*not_a + a[1]*not_b;
endmodule
### Base Verilog Code:
module noteh (o,a,b); // Structural NOT & MUX
output o;
input[1:0]a,b;
wire not_a, not_b;
not g1(not_a,a), g2(not_b,b