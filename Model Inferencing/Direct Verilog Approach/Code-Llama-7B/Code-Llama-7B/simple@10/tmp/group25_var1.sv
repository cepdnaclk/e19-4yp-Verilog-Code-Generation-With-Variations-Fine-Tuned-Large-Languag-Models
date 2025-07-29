module mos_struct_strength (xn, xp);
input xn, xp;
output z;
wire en, c;
assign c = xn ^ xp;
nmos n1 (z, en, c); // NMOS passes 'en' when 'c'