module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
parameter ST_NMOS = 2'b00;
parameter ST_PMOS = 2'b11;
parameter ST_EMPTY = 2'bzz;
parameter [1:0] ST_HYST = ST_NMOS; // Set threshold to ST_NMOS
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Modified Code (2)
The modification to the code above is to replace the xor and and gate expressions with enum, 
but the logic-vector format will be used for the parameter.
### Code Snapshot:
```
module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
parameter [1:0] ST_NMOS = 2'b00;
parameter [1:0] ST_PMOS = 2'b11;
parameter [1:0] ST_EMPTY = 2'bzz;
parameter [1:0] ST_HYST = ST_NMOS; // Set threshold to ST_NMOS
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
```
### Testbench Code:
The testbench code will be the same as the first code, but will test the new logic-vector based enum as 
part of the test.
### Testbench Snapshot:
```
module test_case;
reg c, a, Zp, Zn;
mos_strength mos
(
 .a ( a ),
 .c ( c ),
 .Zp ( Zp ),
 .Zn ( Zn