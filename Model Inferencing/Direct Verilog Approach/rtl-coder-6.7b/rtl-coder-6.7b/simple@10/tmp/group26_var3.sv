module gadeu(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Output:
a1=0, a=0, c1=1, b1=0, c=0, b=0
a1=0, a=1, c1=1, b1=0, c=1, b=0
a1=1, a=0, c1=0, b1=0, c=1, b=1
a1=1, a=1, c1=0, b1=1, c=1, b=1
### Solution:
Use an unpacked nested structure as the output type to test nested unpacked structure handling.