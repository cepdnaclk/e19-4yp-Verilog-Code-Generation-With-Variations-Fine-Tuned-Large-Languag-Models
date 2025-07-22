module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = rand_struct.g | rand_struct.h;
endmodule
### Testbench: example4_test.sv
module example4_test;
class structure;
rand bit g, h;
endclass
const int NUM_ITER = 10;
initial
begin
for (int i=0; i<NUM_ITER; i++) begin
rand_struct = new();
rand_struct.randomize;
$display("g=%b h=%b f=%b", rand_struct.g, rand_struct.h,
rand_struct.g | rand_struct.h);
end
end
endmodule
### Test Results:
f=0 h=0 g=0 f=0
f=0 h=0 g=0 f=0
f=0 h=0 g=0 f=0
f=0 h=0 g=0 f=0
f=1 h=0 g=1 f=1
f=1 h=0 g=1 f=1
f=0 h=1 g=0 f=1
f=1 h=1 g=1 f=1
f=0 h=0 g=0 f=0
f=0 h=0 g=0 f=0
```

## 3.13 Testing with Stimulus Randomization

### 3.13.1 Creating a Testbench

- 3.13.1.1 Simple SystemVerilog Testbench
  
  ```SystemVerilog
  module example6(x1, x2, x3, x4, f, g, h);
  input x1, x2, x3, x4;
  output f, g, h;
  assign g = (x1 & x3) | (x2 & x4);
  assign h = (x1 | x3