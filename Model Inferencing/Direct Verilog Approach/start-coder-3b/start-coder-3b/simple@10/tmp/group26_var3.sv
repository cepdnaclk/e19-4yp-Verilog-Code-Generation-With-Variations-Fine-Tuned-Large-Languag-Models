module gade(input b,input c,input bit[3] d,output a);
output a;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a,c,b);
endmodule
### Expected Result:
The following error message should be issued:
-- 4 Error(s) --
Error(121,45): Variable gade.b[7:0] has unpacked array type. Cannot instantiate an unpacked array input.
Error(121,52): Variable gade.c[7:0] has unpacked array type. Cannot instantiate an unpacked array input.
Error(121,59): Variable gade.d[3:0] has packed array type. Cannot instantiate a packed array input.

### Notes:
(1) Test case cannot be generated.
(2) This is a special case where there is a unpacked structure in the input, and this unpacked structure contains a packed array. This is the way Verilog allows packed array to be used in unpacked structure. The problem here is that this cannot be handled by PackGen. This is not supported in the next release of PackGen.
(3) For more information about the unpacked structure with parameterized instance, please refer to Section 5.5.3 of the IEEE Std 1800-2012.
Source(s):
• User Manual: https://www.intel.com/content/dam/www/public/us/en/documents/software/verilog-2