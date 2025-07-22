```verilog
`timescale 1ns/100ps
module ALU8 (input [7:0] left [7:0], right [7:0], input [1:0] mode, output reg [7:0] ALUout [7:0]);
always_comb begin
    case (mode)
        0: ALUout = left + right;
        1: ALUout = left - right;
        2: ALUout = left & right;
        3: ALUout = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
```
This code creates an array of 8 bit ALU operations. The input arrays can be 8 bits wide and contain multiple elements. The case statement inside the always_comb block does the operation based on the mode input. The result is a 8 bit array output.

Please note: The above code is an attempt to create a verilog module. In actual implementation, the ALU might need more complex behavior, such as carry-out, overflow, or a different mode of operation. Such behavior needs to be specified in the code. This example simply demonstrates the basic concept of the ALU operation, but does not cover all the intricacies of ALU operation.

Also, if you are using Vivado, this code will not compile due to the nature of the synthesis process in Vivado, which requires all the logic to be defined in an always block. Therefore, you will need to re-write your code in such a way that synthesis tool can handle it. It is always recommended to use a synthesis tool to synthesize your design. 

Additionally, synthesizing this code will not produce an 8 bit ALU that performs addition, subtraction, AND, OR operations. This is just a basic example of how to define a verilog module that performs these operations. In practice, you would likely use other blocks to perform these operations and incorporate them into your design. This would include combinational logic blocks (like the AND and OR blocks used here) and other logic blocks as needed to create your ALU. It may also include carry-out, overflow, and other necessary blocks to perform the required operations. 

This is a very simple demonstration and does not fully cover the complexity of an ALU implementation. A complete