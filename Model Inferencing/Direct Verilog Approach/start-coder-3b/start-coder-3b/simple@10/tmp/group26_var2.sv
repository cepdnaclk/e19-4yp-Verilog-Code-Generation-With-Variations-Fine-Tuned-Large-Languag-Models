module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(.a1(c1),.c(b1),.b(b));
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(.a(c),.c(b),.b(b));
endmodule
### Expected Results:
The following error message will be reported:
error: Expected a pack or unpacked structure as the output type
### Current Results:
The above error message is not reported. The pack structure is outputted correctly, as expected.