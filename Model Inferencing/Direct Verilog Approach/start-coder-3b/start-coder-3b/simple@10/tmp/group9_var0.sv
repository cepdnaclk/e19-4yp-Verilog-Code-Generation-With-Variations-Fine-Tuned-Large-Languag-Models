```
module Problem20(input [3:0] a, input [3:0] b, output [3:0] c);
  assign c = a | (b & ~c);
  assign c = 8'b111111111;
  assign c = a | (b & ~c);
  assign c = 8'b111111111;
  assign c = a | (b & ~c);
  assign c = 8'b111111111;
  assign c = a | (b & ~c);
  assign c = 8'b111111111;
  assign c = a | (b & ~c);
  assign c = 8'b111111111;
  assign c = a | (b & ~