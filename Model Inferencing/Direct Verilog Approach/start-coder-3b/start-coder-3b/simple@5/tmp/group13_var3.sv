// Verilog code for Problem 8
module Divider
(
    input A, B,
    output logic[7:0] D, logic[7:0] M
);
    wire D0, D1, D2, D3;
    wire M0, M1, M2, M3;

    Full_Adder F_Adder_0(A, B, M0, D0);
    Full_Adder F_Adder_1(A, M0, M1, D1);
    Full_Adder F_Adder_2(B, M1, M2, D2);
    Full_Adder F_Adder_3(M2, M3, M3, D3);

    Full_Adder F_Adder_4(A, D3, M3, M0);
    Full_Adder F_Adder_5(B, M0, M1, M0);
    Full_Adder F_Adder_6(M1, M2, M2, M1);
    Full_Adder F_Adder_7(M2, M3, D3, M2);

    assign D = D3;
    assign M = M2;
END
```

## Final Instruction

To finish this lab, you must complete the instructions written in the
_Instructions_ file.
/lab1/README.md
# Lab 1 - Basic Digital Logic

_Author: _

## Introduction

For this lab, you will be required to create a Verilog code for the basic digital logic primitives.

## Problem 1: And Gate

The first problem is to create a basic And Gate, that takes in two input signals and outputs a single output signal.

The base code for this problem is found in `base/problem1.v`.

### 1.1) Input/Output

The only input signal to the and gate is `A` and `B`. The output signal is `C`.

The full name of the input signal is `A` and the full name of the output signal is `C`. The names of all of the input and output signals must be all uppercase.

### 1.2) Module Declaration

Here is the Verilog code for the module declaration of the and gate:

```verilog
module And_Gate (
    input A, B,
    output C
);

endmodule
```

### 1.3) Outputs Signals

The output signal of the and gate must be called `C` since it is the name of the _output_ signal.

### 1.4) Assignments

The code inside the `And_Gate` module should have the following code:

```verilog
assign C = A & B;
```

## Problem 2: Or Gate

The second problem is to create a basic Or Gate, that takes in two input signals and outputs a single output signal.

The