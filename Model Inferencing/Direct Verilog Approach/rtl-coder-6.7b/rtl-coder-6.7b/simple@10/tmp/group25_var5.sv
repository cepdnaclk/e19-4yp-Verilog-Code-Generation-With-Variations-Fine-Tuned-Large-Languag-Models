module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
### Results:
The results were all correct with the following test sequences:
```
a		c	zn	zp	
0		0	1	0	
0		1	0	0	
1		0	0	1	
1		1	X	X	
```