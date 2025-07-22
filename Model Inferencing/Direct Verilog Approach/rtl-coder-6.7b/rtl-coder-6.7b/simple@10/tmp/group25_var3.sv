module mos_strength_enum (zn, zp, a, c);
input a, c;
output zn, zp;
enum logic {St0, St1, Z} m;
zp = 0;
zn = 0;
m = (a | (a & c));
// zp = (a | (a & c));
// zn = (a & (a | c));
endmodule
### Output Log:
### Verilog Code:
module mos_strength_enum (zn, zp, a, c);
input a, c;
output zn, zp;
logic [1:0] m;
enum logic {St0 = 0, St1 = 1, Z = 2} m;