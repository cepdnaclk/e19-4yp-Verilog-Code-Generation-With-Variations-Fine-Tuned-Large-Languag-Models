`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout = left[3:0] + right[3:0];
        1: ALUout = left[3:0] - right[3:0];
        2: ALUout = left[3:0] & right[3:0];
        3: ALUout = left[3:0] | right[3:0];
        default: ALUout = 8'bX;
    endcase
end
endmodule
`

**Explanation:**

First, notice that the operands are now only 4 bits. This is because the ALU8 is operating on 8 bit values. So, the maximum addition/subtraction of 8 bit values can only be a 4 bit value.

Second, notice that the operator is now operating on **part** of the 8 bits. Remember, the ALU is operating on 8 bits, and the operator can only be operating on 4 bits of those 8 bits. So the operator is operating on the `[3:0]` part of the 8 bit value.

**Result:**

[![Alu8](https://i.stack.imgur.com/lU44v.gif)](https://i.stack.imgur.com/lU44v.gif)
Upvotes: 2