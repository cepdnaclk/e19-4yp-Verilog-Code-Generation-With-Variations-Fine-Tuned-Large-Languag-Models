module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
xor (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
xor (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Verilog Code
module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
xor (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
xor (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule