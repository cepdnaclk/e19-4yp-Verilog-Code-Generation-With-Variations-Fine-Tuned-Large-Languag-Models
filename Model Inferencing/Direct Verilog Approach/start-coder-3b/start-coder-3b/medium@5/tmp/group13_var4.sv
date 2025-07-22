reg a,b,c;
wire d;
assign d = (a & b) | c;
### Variation Instruction:
Use in expression

I see this as a bug, because of the following two features:

1. The & operation used in the assign statement is part of the default 'and' operation.
2. The | operation used in the assign statement is part of the default 'or' operation.

The default operation for the & and | operations is not the bitwise & or | operations. Instead, the default operations are the logical & and | operations. These are the logical operations, which are not the bitwise operations.

Note that this bug does not occur if all three operands to the | are constants.

### Modified Verilog Code:
reg a,b,c;
wire d;
assign d = a | b | c;
### Variation Instruction:
Use in expression

I see this as a bug, because of the following two features:

1. The | operation used in the assign statement is part of the default 'or' operation.
2. These are the logical operations, which are not the bitwise operations.

The default operation for the | operation is not the bitwise | operation. Instead, the default operation is the logical | operation. These are the logical operations, which are not the bitwise operations.

Note that this bug does not occur if all three operands to the | are constants.

### Modified Verilog Code:
reg a,b,c;
wire d;
assign d = a & b | c;
### Variation Instruction:
Use in expression

I see this as a bug, because of the following two features:

1. The & operation used in the assign statement is part of the default 'and' operation.
2. The | operation used in the assign statement is part of the default 'or' operation.

The default operation for the & and | operations is not the bitwise & or | operations. Instead, the default operations are the logical & and | operations. These are the logical operations, which are not the bitwise operations.

Note that this bug does not occur if all three operands to the & and the | are constants.

### Modified Verilog Code:
reg a,b,c;
wire d;
assign d = a & b | c;
### Variation Instruction:
Use in expression

I see this as a bug, because of the following two features:

1. The & operation used in the assign statement is part of the default 'and' operation.
2. The | operation used in the assign statement is part of the default 'or' operation.

The default operation