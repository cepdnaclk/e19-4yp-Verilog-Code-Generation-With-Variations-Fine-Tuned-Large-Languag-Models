module mos_strength (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
nmos (zn[0], a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp[0], a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
pmos