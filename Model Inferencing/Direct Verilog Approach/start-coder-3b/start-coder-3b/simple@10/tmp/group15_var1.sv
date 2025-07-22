module ALU (
input clk,
input [7:0] op1,
input [7:0] op2,
input [4:0] op,
output [7:0] result
);
wire [7:0] op1_signed, op2_signed, result_signed ;
wire [7:0] ALU_result_signed ;

assign op1_signed = (op1[7])? ~op1 + 1'b1 : op1;
assign op2_signed = (op2[7])? ~op2 + 1'b1 : op2;

assign ALU_result_signed = (result[7])? ~result + 1'b1 : result;

begin
case (op)
4'b0000 : result = op1 + op2;
//4'b0001 : result = op1 - op2;
//4'b0010 : result = op1 * op2;
//4'b0011 : result = op1 / op2;
//4'b0100 : result = op1 & op2;
//4'b0101 : result = op1 | op2;
//4'b0110 : result = op1 ^ op2;
//4'b0111 : result = -op1;
//4'b1000 : result = --op1;
//4'b1001 : result = op1 + 1'b1;
//4'b1010 : result = op1 + 1'b0;
//4'b1011 : result = op1 << 1;
//4'b1100 : result = op1 >> 1;
default: result = op1;
endcase
endmodule
### Run the Simulation:
Open the new test bench file created by the modifications in the ALU module.
Run the simulation:

## Week 8

### Base Verilog Code:
module ALU (
input clk,
input [7:0] op1,
input [7:0] op2,
input [4:0] op,
output [7:0] result
);

assign result = op1 + op2;
endmodule
### Variation Instruction:
Modify the ALU module to allow the ALU to support the following 8-bit integer arithmetic operations:

• Addition
• Subtraction
• Multiplication
• Division
• Bitwise and
• Bitwise OR
• Bitwise XOR
• Increment
• Decrement
•