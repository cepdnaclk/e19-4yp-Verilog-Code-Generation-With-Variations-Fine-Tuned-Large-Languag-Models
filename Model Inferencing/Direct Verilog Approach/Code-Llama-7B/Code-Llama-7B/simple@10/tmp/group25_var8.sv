module mos_strength (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
nmos (zn[0], a, c);
pmos (zn[1], a, c);
endmodule
### Expected Output (1):
zn = 2'b00
zp = 2'b00
### Expected Output (2):
zn = 2'b10
zp = 2'b01
### Expected Output (3):
zn = 2'b00
zp = 2'b00
### Expected Output (4):
zn = 2'b11
zp = 2'b11
### Expected Output (5):
zn = 2'b11
zp = 2'b11
### Expected Output (6):
zn = 2'b10
zp = 2'b11
### Expected Output (7):
zn = 2'b10
zp = 2'b10
### Ex