module Anding (
input a, b,
input [1:0] c,
output y);
and (y, a, b, c[0], c[1]);
endmodule
### Test Inputs:
- a: 1
- b: 0
- c: 10
## Outputs:
y:
- 0
- 1
- 1
- 0
- 0