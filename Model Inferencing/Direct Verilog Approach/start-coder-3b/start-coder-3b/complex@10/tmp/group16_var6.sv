```
module tb_TOP1(CLK);
  wire [31:0] x;
  wire [31:0] y;
  wire [31:0] z;
  
  // #3: Generate constants for array elements from 0 to 5
  generate
    for (i=0; i<6; i=i+1) begin:gen_constant_for_array
      constant ARRAY_VALUE_0 = 2 * i;
      constant ARRAY_VALUE_1 = 2 * i + 1;
    end
  endgenerate
  
  // #4: Declare constant array of 6 elements
  constant [31:0] ARRAY_CONSTANT [5];
  
  // #5: Remove package
  // package CONSTANTS;
  //   constant [31:0] ARRAY_CONSTANT [5];
  // endpackage
  
  // #6: Instantiate package
  // CONSTANTS constants(.ARRAY_CONSTANT(ARRAY_CONSTANT));
  
  // #7: Generate array elements from 0 to 5
  generate
    for (i=0; i<6; i=i+1) begin:gen_array_for_array
      assign ARRAY_CONSTANT[i] = ARRAY_VALUE_0;
      assign ARRAY_CONSTANT[i+1] = ARRAY_VALUE_1;
    end
  endgenerate
  
  assign x = {1'b0, 7'b101010};
  assign y = {10'b1010101010};
  assign z = (ARRAY_CONSTANT inside_array x);
endmodule
```

### Expected Output:
![array-inside-array](./images/array-inside-array.png)
#include <cassert>

#include <bitset>
#include <iostream>
#include