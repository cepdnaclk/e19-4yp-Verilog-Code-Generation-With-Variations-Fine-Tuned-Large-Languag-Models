module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
wire [1:0] St0 = 2'b00;
wire [1:0] St1 = 2'b01;
wire [1:0] Z = 2'b11;
enum logic [1:0] {
NMOS,
PMOS
} nmos_pmos_switch;
enum logic [1:0] {
ZERO,
ONE
} zero_one_switch;
nmos_pmos_switch = c? NMOS : PMOS;
zero_one_switch = a? ONE : ZERO;
zn = (zero_one_switch & {2{nmos_pmos_switch == NMOS}})? Z: St0;
zp = (zero_one_switch & {2{nmos_pmos_switch == PMOS}})? Z: St1;
endmodule