module netdelay4_2(x,y);
input x;
output [31:0] y; // Declare wire 'y' as 32-bit packed structure
wire nn[(2,4)]; // Declare wire 'nn' as a 2-rise, 4-fall packed structure

not (nn,x); // Assign NOT(x) to 'nn' (takes effect