module mos_strength (a, c, zn, zp);
input [1:0] a, c;
output [1:0] zn, zp;
nmos (zn, a[0], c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a[1], c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Test-bench Code:
module ver_test();
//Test input and output
reg [1:0] a = 0;
reg c = 0;
wire [1:0] zn, zp;
mos_strength moso(.a(a),.c(c),.zn(zn),.zp(zp));
initial
begin
    c = 0;
    a = 0;
    #15
    c = 1;
    a = 1;
    #20
    c = 0;
    a = 0;
    #15
    c = 1;
    a = 1;
    #5
    c = 0;
    a = 0;
    #15
    c = 1;
    a = 1;
    #20
    c = 0;
    a = 0;
    #20
    c = 1;
    a = 1;
    #