module AndOr (output X, Y, input [1:0] A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Reference Code:
module AndOr (output X, Y, input [1:0] A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule

### Test Case:
1. Checks to make sure code can synthesize.

### Pass Criteria:
Code synthesizes without error.

### Fail Criteria:
Code does not synthesize without error.

### Comments:

### Requirements Covered:
- B-1484259
- B-1219357

### Covered Issues (in `requirements.txt`):
- B-1484259
- B-1219357

### Tested Modules:
- `andor.sv` (non-forked)

### Tested Functional Units:
- `and`
- `or`

### Tested