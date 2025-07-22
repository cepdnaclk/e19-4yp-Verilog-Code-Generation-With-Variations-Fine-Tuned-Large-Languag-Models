Assuming package file `pkg.sv` contains a function `is_in_array(input [63:0] x)` which returns true if `x` is inside the array defined:

```verilog
package pkg;
  reg [16:0] array_in_pkg = '{10, 20, 30, 40, 50, 60, 70, 80, 90, 100};

  function is_in_array(input [63:0] x);
    is_in_array = (x inside {array_in_pkg})? 1:0;
  endfunction
endpackage
```

In this array, we are checking whether the input x is inside. The `inside` operator allows the checking of membership for an input value in the specified range. 

The `inside` operator checks if the value on its left-hand side (the input `x`) falls into any of the values on its right-hand side (in this case the array `array_in_pkg`). If there is a match, the condition returns 1. If there isn't a match, it returns 0.

So you can modify the comparator logic like this:

```verilog
module TOP1(input CLK, input RST_X, output reg [63:0] RESULT);
  reg [63:0] x;
  always @(posedge CLK) begin
    if(RST_X == 1'b1) begin
      RESULT = 64'd0;
      x = 64'd0;
    end else begin
      x = x + 64'd1;
      RESULT = $bits(x)'(pkg::is_in_array(x));
    end
  end
endmodule
```
This modified code is using the `pkg::is_in_array` function to check if `x` is inside the array and use the result as the RESULT output.

As a note, the `pkg::is_in_array` should be replaced with your own logic which determines if a value is inside an array or not. The `pkg` in `pkg::is_in_array`