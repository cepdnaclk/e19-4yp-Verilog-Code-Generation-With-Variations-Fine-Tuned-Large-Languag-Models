module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;

enum logic [1:0] {St0 = 2'b00, St1 = 2'b01, Z = 2'b1X} a_c;

always_comb
a_c = {a, c};

nmos (zn, a_c, Z);
pmos (zp, St0, a_c);

endmodule