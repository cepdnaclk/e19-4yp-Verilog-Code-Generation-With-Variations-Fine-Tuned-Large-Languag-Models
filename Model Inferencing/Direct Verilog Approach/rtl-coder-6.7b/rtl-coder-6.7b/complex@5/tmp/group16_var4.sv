module comparator_x_v2(
  input  logic [1:0] x,
  output logic o
);
  import pkg::*;
  always_comb begin
    o = x inside {a, b, c};
  end
endmodule
### Verification Environment:
module tb_comparator_x_v2;
  logic [1:0] x;
  logic o;
  comparator_x_v2 uut(.x(x),.o(o));

  initial begin
    x = 2'b01; #5 x = 2'b10; #5 x = 2'b01;
    x = 2'b00; #5 x = 2'b11;
  end
endmodule
### Testbench Output:
```
x = 2'b01, o = 1'b1
x = 2'b10, o = 1'b1
x = 2'b01, o = 1'b1
x = 2'b11, o = 1'b0
```