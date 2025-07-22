module gads(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1