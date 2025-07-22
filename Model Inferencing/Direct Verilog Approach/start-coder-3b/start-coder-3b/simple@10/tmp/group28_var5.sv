module example3(Data, Clock, Reset, RegSum, Sum);
input Clock, Reset;
input [4:0] Data;
output [3:0] Sum, RegSum;
reg4 R1 (Sum, Clock, Reset, RegSum);
assign Sum = Data + RegSum;
endmodule
### Expected Output:
![example3_wire_reg_output.png](example3_wire_reg_output.png)

[top](#)

## test_examples_4bit_register_with_bit

Test the output of a 4-bit register 10 times. Make sure the output of the register is correct.

[top](#)

## test_examples_4bit_register_with_reg

Test the output of a 4-bit register 10 times. Make sure the output of the register is correct.

[top](#)

## test_examples_2bit_register_with_wire

### Purpose:
Verify that a 2-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 2-bit wire.

[top](#)

## test_examples_2bit_register_with_reg

### Purpose:
Verify that a 2-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 2-bit wire.

[top](#)

## test_examples_2bit_register_with_wire_array

### Purpose:
Verify that a 2-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 2-bit wire array.

[top](#)

## test_examples_2bit_register_with_reg4

### Purpose:
Verify that a 2-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 2-bit reg4.

[top](#)

## test_examples_4bit_register_with_wire

### Purpose:
Verify that a 4-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 4-bit wire.

[top](#)

## test_examples_4bit_register_with_reg

### Purpose:
Verify that a 4-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 4-bit wire.

[top](#)

## test_examples_4bit_register_with_wire_array

### Purpose:
Verify that a 4-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 4-bit wire array.

[top](#)

## test_examples_4bit_register_with_reg4

### Purpose:
Verify that a 4-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 4-bit reg4.

[top](#)

## test_examples_8bit_register_with_wire

### Purpose:
Verify that a 8-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 8-bit wire.

[top](#)

## test_examples_8bit_register_with_reg

### Purpose:
Verify that a 8-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 8-bit wire.

[top](#)

## test_examples_8bit_register_with_wire_array

### Purpose:
Verify that a 8-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 8-bit wire array.

[top](#)

## test_examples_8bit_register_with_reg4

### Purpose:
Verify that a 8-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 8-bit reg4.

[top](#)

## test_examples_16bit_register_with_wire

### Purpose:
Verify that a 16-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 16-bit wire.

[top](#)

## test_examples_16bit_register_with_reg

### Purpose:
Verify that a 16-bit register can be stored inside of a 4-bit register.
### Variation Instruction:
Change the wire declaration from wire [3:0] Sum, RegSum to a 16-bit wire.

[top](#)

## test_examples_16bit_register_with_wire_array