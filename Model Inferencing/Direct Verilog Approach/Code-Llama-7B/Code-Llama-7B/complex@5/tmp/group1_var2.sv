module tst_nor3NMOS();
  reg in1,in2,in3; wire b;
  generate
    genvar n,o;
    for(n = 0; n < 3; n = n + 1) begin: \gen_block1
      for(o = 0; o < 2; o = o + 1) begin
        nor3NMOS nn(in1,in2,in3,b);
      end
    end
  endgenerate
endmodule
### Expected Printed Output:
in1 = 0, in2 = 0, in3 = 0, output = 1
in1 = 0, in2 = 0, in3 = 1, output = 1
in1 =