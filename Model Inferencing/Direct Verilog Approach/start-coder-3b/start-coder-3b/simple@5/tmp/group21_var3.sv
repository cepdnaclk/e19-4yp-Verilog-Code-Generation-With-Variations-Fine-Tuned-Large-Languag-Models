module example9(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
reg [1:0] c;
structure{
random c;
} s;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule
### Test Suite:
#### Test 1:
x1, x3 = 1, x2, x4 = 0
#### Test 2:
x1, x3 = 0, x2, x4 = 1
#### Test 3:
x1, x3 = 1, x2, x4 = 1
#### Test 4:
x1, x3 = 0, x2, x4 = 0
### 11. Example 10
### Base Verilog Code:
module example10(x1, x2, x3, x4, f, g