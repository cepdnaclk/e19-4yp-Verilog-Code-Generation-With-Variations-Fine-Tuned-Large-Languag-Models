```
module tst_xor3NMOS();
  reg in1,in2,in3; wire b;
  xor3NMOS nn(in1,in2,in3,b); 
gen_block1: generate
xor3NMOS nn2( in1, in2, in3, b);
endgenerate
  initial begin
    in1=1'