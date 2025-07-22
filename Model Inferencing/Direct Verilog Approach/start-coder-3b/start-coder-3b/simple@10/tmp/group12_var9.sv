module Problem5(input [3:0] a, b, output [3:0] s, output [3:0] r);
  assign s = b & a;
  assign r = a - 1;
endmodule
```