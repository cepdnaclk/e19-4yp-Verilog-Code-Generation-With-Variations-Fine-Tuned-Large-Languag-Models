```
module mos_strength (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
```
### Generated Constraint File:
```
//----- Enum Variables.
enum {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z} a;
enum {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z} c;
//----- Ports.
output [1:0] z0, z1;
//----- Nets.
wire [1:0] z0, z1;
//----- Module Body.
nmos (z0, a, c);
pmos (z1, a, c);
endmodule
```
### Generated Test Bench File:
```
module mos_strength_tb (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
nmos (zn, a, c);
pmos (zp, a, c);
endmodule
```
### Generated Test Bench Module Properties:
```
module mos_strength_tb_prop (a, c, zn, zp);
input a, c;
output [1:0] zn, zp;
nmos (zn, a, c);
pmos (zp, a, c);
endmodule
```
### Generated Test Bench Case 0:
```
`timescale 1ns / 1ps
module mos_strength_tb_case_0 (a, c, zn, zp);
`ifdef SIMULATOR