module AndOr (output X, Y, input A, B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Results:
The following circuit schematics and waveform show that all the tests pass for both synthesizable and non-synthesizable designs.
![Test Results for 3-input AND & OR logic circuit](./images/3-input-results.png)


### Test Cases

The following 11 test cases were implemented for the full 3-input AND and OR logic circuit:

1. `A | B | C`: Tests the 3-input OR case.
2. `A | B`: Tests the 2-input OR case.
3. `A & B`: Tests the 2-input AND case.
4. `A | B & C`: Tests the 3-input OR case when the OR part of the logic gate is ORing.
5. `A & B & C`: Tests the 3-input AND case.
6. `A & (B | C)`: Tests the 3-input AND case when the AND part of the logic gate is ANDing.
7. `A | B & C`: Tests the 3-input OR case when the AND part of the logic gate is ANDing.
8. `A & B | C`: Tests the 3-input AND case when the OR part of the logic gate is ORing.
9. `A ^ B ^ C`: Tests the 3-input XOR case when the XOR part is ORing.
10. `A ^ B`: Tests the 2-input XOR case when the XOR part is ORing.
11. `A ^ A`: Tests the 2-input XOR case when the XOR part is ANDing.

#### Test Result:
![Test Results](./images/test-result.png)
#### Test Time:
![Test Results Time](./images/test-time.png)

## Implementation Details

### Design Overview

My design for the 3-input AND and OR logic circuit is shown in the following figure.

![Full 3-input AND & OR logic circuit](./images/3-input-logic-circuit.png)

### HDL Code

The full 3-input AND and OR logic circuit is shown below.

```
module AndOr(
    output wire[1:0] X,
    output wire[1:0] Y,
    input wire A,
    input wire B,
    input wire C
);
    And2(
       .A(A),
       .B(B),
       .F(X[0])
    );
    Or2(
       .A(X[0]),
       .B(C),
       .F(X[1])
    );
    And2(
       .A(B),
       .B(C),
       .F(Y[0])
    );
    Or2(
       .A(Y[0]),
       .B(X[1]),
       .F(Y[1])
    );
endmodule
```

In my design I use two 2-input gates to form the full 3-input AND and OR logic circuit.  The 2-input gates are implemented with transistors and resistors and in 2-input NAND and NOR gates.  The output of the first 2-input NAND gate is then used as the input for the first 2-input NOR gate.  The 2 output of the last 2-input NOR gate are then the inputs for the 3-input NAND gate.  Lastly the 3-input NAND gate is then used to form the output X and Y of the 3-input AND and OR logic circuit.

### HDL Code for 2-input NAND and NOR gates

Below is the HDL code for my 2-input NAND and NOR gates.

```
module Nand2(
    output reg F,
    input A,
    input B
);
    assign F = ~A & ~B;
endmodule

module Nor2(
    output reg F,
    input A,
    input B
);
    assign F = ~(A | B);
endmodule
```

### HDL Code for 2-input AND and OR gates

Below is the HDL code for the 2-input AND and OR gates.

```
module And2(
    output reg F,
    input A,
    input B
);
    Nand2 N1(.A(A),.B(B),.F(F));
    assign F = F;
endmodule

module Or2(
    output reg F,
    input A,
    input B
);
    Nor2 N1(.A(A),.B(B),.F(F));
    assign F = F;
endmodule
```

## Simulation Results

### Test Results for 2-INPUT AND & OR logic circuit

The following circuit schematics and waveform show that all the tests pass for both synthesizable and non-synthesizable designs.

![Test Results for 2-INPUT AND & OR logic circuit](./images/2-input-results.png)

### Test Cases

The following 5 test cases were implemented for the 2-input AND and OR logic circuit:

1. `A`: Tests the 2-input AND case.
2. `B`: Tests the 2-input OR case.
3. `A | B`: Tests the 2-input OR case.
4. `A & B`: Tests the 2-input AND case.
5. `A ^ B`: Tests the 2-input XOR case.

#### Test Result:
![Test Results](./images/2-input-test-result.png)
![Test Results Time](./images/2-input-test-time.png)

## Simulation Results for Full 3-input AND & OR logic circuit
### Test Results for 3-INPUT AND & OR logic circuit

The following circuit schematics and waveform show that all the tests pass for both synthesizable and non-synthesizable designs.

![Test Results for 3-INPUT AND & OR logic circuit](./images/3-input-results.png)

### Test Cases

The following 11 test cases were implemented for the full 3-input AND and OR logic circuit:

1. `A | B | C`: Tests the 3-input OR case.
2. `A | B`: Tests the 2-input OR case.
3. `A & B`: Tests the 2-input AND case.
4. `A | B & C`: Tests the 3-input OR case when the OR part of the logic gate is ORing.
5. `A & B & C`: Tests the 3-input AND case.
6. `A & (B | C)`: Tests the 3-input AND case when the AND part of the logic gate is ANDing.
7. `A | B & C`: Tests the 3-input OR case when the AND part of the logic gate is ANDing.
8. `A & B | C`: Tests the 3-input AND case when the OR part of the logic gate is ORing.
9. `A ^ B ^ C`: Tests the 3-input XOR case when the XOR part is ORing.
10. `A ^ B`: Tests the 2-input XOR case when the XOR part is ORing.
11. `A ^ A`: Tests the 2-input XOR case when the XOR part is ANDing.

#### Test Result:
![Test Results](./images/3-input-test-result.png)
![Test Results Time](./images/3-input-test-time.png)

## Conclusion

All of my test cases for both 2-input AND and OR logic circuit pass with both synthesizable and non-synthesizable implementations.  The full 3-input AND and OR logic circuit tests all of the possible inputs for the AND and OR logic gates with both synthesizable and non-synthesizable designs.

## References:
[1] https://www.electronics-tutorials.ws/wp-content/uploads/2016/06/nand-or.png

[2] http://inst.eecs.berkeley.edu/~cs451/sp16/projects/project2.html

[3] https://www.electronics-tutorials.ws/logic/logic_2.html

[4] http://netlib.cs.umn.edu/netlib/people/bringmann/doc/ANDOR.html

[5] https://en.wikipedia.org/wiki/NAND_logic

[6] https://en.wikipedia.org/wiki/NOR_logic

[7] https://en.wikipedia.org/wiki/XOR_logic

[8] https://en.wikipedia.org/wiki/XNOR_logic

[9] https://www.ece.kth.se/courses/09090/lecture1.pdf

[10] https://www.ece.kth.