module gade(a,a1,b,c,b1,c1);
input logic b,c,b1,c1;
output a,a1;
logic gg1;
logic gg2;
// Instantiate OR gate with inertial delay 3
or #3 gg1(gg1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(gg2,c,b);
assign a=gg2;
assign a1=gg1;
endmodule
### Variation Instruction:
Use an unpacked nested structure as the output type to test nested unpacked structure handling. 
The test should be run with the +assert_on option to enable Assertion checking.
```