module wand1(input [3:0]c, output z);
assign z = c; // Changed operand
endmodule
### Variation Instruction:
Use inside an if statement on an expression (not a variable) that is part-select on an array slice and is indexed by a variable with the same port name as the array
### Ex