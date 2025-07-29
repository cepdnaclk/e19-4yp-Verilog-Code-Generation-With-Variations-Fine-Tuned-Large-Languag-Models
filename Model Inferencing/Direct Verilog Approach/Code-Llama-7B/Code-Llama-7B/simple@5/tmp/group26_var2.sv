`timescale 1ns / 10ps
module gade(a,a1,b,c,b1,c1)

// Declare internal wires
wire a1, b1, c1, g1, g2;

// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
module or(a,b,c);
input a,b;
output c;
// Define internal wires
wire g;
and and1(g,a,b);
or  or1(c,a,b);
endmodule
module and(a,b,c);
input a,b;
output c;
// Define internal wires
wire g1, g2;

and and1(g1,a,b);
not not1