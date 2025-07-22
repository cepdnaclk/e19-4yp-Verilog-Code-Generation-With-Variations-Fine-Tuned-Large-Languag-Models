module Problem1(input [3:0] a, b, output [3:0] sum);
  reg [3:0] di;
  reg clk;
  assign sum = a + b;
endmodule
### Exceptions:
1. No errors detected
2. No warnings detected
### Validation:
1. [x] Code compiles
2. [ ] Output matches spec (sum = a + b)
3. [ ] Output matches spec (sum = a xor b)
4. [ ] Output matches spec (sum = a. b)
5. [x] Output matches spec (sum = a + 1)