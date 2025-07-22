```
module Test(input [1:0] a, b, c, output [1:0] d);
  assign c = d | a;
  assign d = b & ~c;
endmodule
```