`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
   case (mode)
      0: ALUout = left[mode] + right;
      1: ALUout = left[mode] - right;
      2: ALUout = left[mode] & right;
      3: ALUout = left[mode] | right;
      default: ALUout = 8'bX;
   endcase
end
endmodule

### Summary:
The original code was combinational in nature. In fact, there is an implicit latch in the original code. In the modified code, the combinational nature of the code is maintained. However the part-select in the operands is replaced with an indexed array. This ensures that the part-select is evaluated in the same clock cycle.

### Changes to the original code:
In the original code, the part-selects left[mode] and right are not evaluated in the same clock cycle. This is due to the fact that the case statement is evaluated in a different clock cycle. The part-selects are replaced with indexed arrays to ensure they are evaluated in the same clock cycle.


### Suggested Learning Outcomes:

1. To know when indexed arrays can be used to replace part-selects.
2. To know the consequences of replacing part-selects with indexed arrays.

### Difficulty