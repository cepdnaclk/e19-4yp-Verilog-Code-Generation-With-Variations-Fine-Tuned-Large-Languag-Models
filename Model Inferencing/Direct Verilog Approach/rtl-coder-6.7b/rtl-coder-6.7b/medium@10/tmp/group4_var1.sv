module jk(in0, out);
  output [0:1] out;
  input [0:1] in0;
  supply0 a; // Ground
  supply1 vcc; // VCC
  nor3NMOS nor0(in0[0],in0[0],in0[1],out[0]); // NOR
  nor3NMOS nor1(in0[0],in0[1],in0[1],out[1]); // NOR
  pullup (out[0]);
  pullup (out[1]);
endmodule