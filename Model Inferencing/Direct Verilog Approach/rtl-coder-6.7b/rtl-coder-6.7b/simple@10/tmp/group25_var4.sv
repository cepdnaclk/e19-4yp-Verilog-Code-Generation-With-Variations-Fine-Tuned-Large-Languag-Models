module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, c, a); // NMOS passes 'a' when 'c' is 1 (outputs 'z' or 'a')
pmos (zp, c, a); // PMOS passes 'a' when 'c' is 0 (outputs 'z' or 'a')
endmodule
### Synthesized Circuit: