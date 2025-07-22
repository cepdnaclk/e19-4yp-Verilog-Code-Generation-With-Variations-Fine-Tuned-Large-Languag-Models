```verilog
always @(s or A or B)
    case (s)
        0: F = 4'b0000;
        1: F = B - A;
        2: F = A - B;
        3: F = A + B;
        4: F = A ^ B;
        5: F = A | B;
        6: F = A & B;
        7: F = 4'b1111;
    endcase
```
### Execution:
```log
S: 00001111
A: 10000001
B: 10100000
X: 10000001
Y: 10100000
F: 00000000
S: 01000101
A: 11100000
B: 10000001
X: 11100000
Y: 10000001
F: 11100101
```

## Test Cases

#### Case 1:
- Operand A is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Operand B is the constant of the range of index `[1, 6]`. (1, 2, 3, 4, 5, 6).
- Instruction: `S=1111`

#### Case 2:
- Operand A is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Operand B is the constant of the range of index `[2, 11]`. (2, 3, 4, 5, 6, 7, 8, 9, 10, 11).
- Instruction: `S=0000`

#### Case 3:
- Operand A is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Operand B is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Instruction: `S=1110`

#### Case 4:
- Operand A is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Operand B is the constant of the range of index `[24, 31]`. (24, 25, 26, 27, 28, 29, 30, 31).
- Instruction: `S=1111`

#### Case 5:
- Operand A is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Operand B is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Instruction: `S=0001`

#### Case 6:
- Operand A is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Operand B is the constant of the range of index `[24, 31]`. (24, 25, 26, 27, 28, 29, 30, 31).
- Instruction: `S=1000`

#### Case 7:
- Operand A is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Operand B is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Instruction: `S=0111`

#### Case 8:
- Operand A is the constant of the range of index `[8, 15]` (8, 9, 10, 11, 12, 13, 14, 15).
- Operand B is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Instruction: `S=0000`

#### Case 9:
- Operand A is the constant of the range of index `[17, 24]`. (17, 18, 19, 20, 21, 22, 23, 24).
- Operand B is the constant of the range of index `[7, 14]`. (7, 8, 9, 10, 11, 12, 13, 14).
- Instruction: `S=0110`

#### Case 10:
- Operand A is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Operand B is the constant of the range of index `[17, 24]`. (17, 18, 19, 20, 21, 22, 23, 24).
- Instruction: `S=0000`

#### Case 11:
- Operand A is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Operand B is the constant of the range of index `[8, 15]`. (8, 9, 10, 11, 12, 13, 14, 15).
- Instruction: `S=0001`

#### Case 12:
- Operand A is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Operand B is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Instruction: `S=0001`

#### Case 13:
- Operand A is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Operand B is the constant of the range of index `[17, 24]`. (17, 18, 19, 20, 21, 22, 23, 24).
- Instruction: `S=0110`

#### Case 14:
- Operand A is the constant of the range of index `[16, 23]`. (16, 17, 18, 19, 20, 21, 22, 23).
- Operand B is the constant of the range of index `[3, 10]`. (3, 4, 5, 6, 7, 8, 9, 10).
- Instruction: `S=0111`

#### Case 15:
- Operand A is the constant of the range of index `[17, 24]`. (17, 18, 19, 20, 21, 22, 23, 24).
- Operand B is the constant of the range of index `[16, 23]`. (16, 17, 18, 1