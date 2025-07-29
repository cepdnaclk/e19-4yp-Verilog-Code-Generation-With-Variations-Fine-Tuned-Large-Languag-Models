module mos_test (
   a1,a2,c,z,
   z1,z2,z3,z4,
   z5,z6,z7,z8,
   z9,z10,z11,z12,
   z13,z14,z15,z16
);
input a1,a2,c;
output z,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16;

logic [15:0] mux [0:1];


assign mux[0] = {z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15};
assign mux[1] = {z16};

assign z = (c)? mux[1] : mux[0];

nmos