```
module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
```
### Expected Result:
![result](https://cdn.instructables.com/FH3/P70T/I2CZJF0Z/FH3P70TI2CZJF0Z.LARGE.jpg)
### Instructables Link:
[Instructables](https://www.instructables.com/id/Verilog-Enum/)