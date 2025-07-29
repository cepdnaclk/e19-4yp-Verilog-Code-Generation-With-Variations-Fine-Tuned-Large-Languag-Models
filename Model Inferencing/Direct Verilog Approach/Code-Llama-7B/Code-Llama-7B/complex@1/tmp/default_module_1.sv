module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  wire gen_block1;
  generate
   gen_block1 = 1'b1;
  endgenerate
  nor3NMOS nn(in1,in2,in3,b); // Instantiate NMOS