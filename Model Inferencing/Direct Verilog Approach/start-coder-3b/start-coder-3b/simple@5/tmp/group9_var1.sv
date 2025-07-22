```
module Problem17(input [3:0] a, b, output [3:0] diff);
  reg [3:0] reg1, reg2, reg3;
  assign reg1 = a - b;
  assign reg2 = reg1 - a + b;
  assign reg3 = reg2 - reg1;
  assign