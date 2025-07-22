module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Assertion 1
assert property (@(posedge a) b ##[0:$] a ##[1:$] c ##[0:$] c1 ##[0:$] a1 ##[0:$] b1)
### Assertion 2
## Assertion 2
## Slow Assertion 1
## Slow Assertion 2