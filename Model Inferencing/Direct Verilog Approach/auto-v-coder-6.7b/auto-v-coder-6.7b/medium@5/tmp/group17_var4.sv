```verilog
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output reg z
);

always @ (*) begin
  case (s) 
   2'b00: z = c[0];
   2'b01: z = c[1];
   2'b10: z = c[2];
   2'b11: z = c[3];
   default: z = c[0];
  endcase
end
endmodule
```
This modification will allow the selection of any element of the array 'c' based on the values of's' in a case-based decision. The 'default' statement is used if none of the other conditions are met, in which case it will select the first element of the array. Please note that the 'output reg z' declares a register as the output, which is necessary for the case statement to work properly.

This code is more readable and expressive, it is clear what it is doing. The original code in the problem was written in a more condensed and complex form, which might be harder to understand for someone not familiar with the specific Verilog constructs.

It is also safer to use'reg' instead of 'wire' for output because 'wire' types can behave unpredictably when used with the case statement. This code will give an error if used with 'wire' type.

To convert this code to the Verilog language we have to use the case statement to select the value from the 'c' array based on the values of's'. The 'always @ (*)' block makes the block's behavior to be executed whenever any of the inputs change.

This code is more expressive and readable. It's clear what it's doing and it's also safe with the case statement. However, always remember to always use'reg' types for output values when using case statements, because 'wire' can behave unpredictably when used together with case.

Also, make sure to replace 'wire z' by'reg z' if you're expecting to reassign the output value. If you're planning to use 'wire' type in this output, you might need to check your entire code again, because the case statement does not handle 'wire'