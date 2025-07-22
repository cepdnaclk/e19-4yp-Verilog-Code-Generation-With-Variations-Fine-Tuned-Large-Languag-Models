module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();

    assign fa0.A = fa1.A;
    assign fa0.B = fa1.B;
    assign fa0.C = fa1.C;
    assign fa0.D = fa1.D;

    assign fa1.A = fa2.A;
    assign fa1.B = fa2.B;
    assign fa1.C = fa2.C;
    assign fa1.D = fa2.D;

    assign fa2.A = fa3.A;
    assign fa2.B = fa3.B;
    assign fa2.C = fa3.C;
    assign fa2.D = fa3.D;

    assign fa3.A = fa0.C;
    assign fa3.B = fa0.D;
    assign fa3.C = fa0.D;
    assign fa3.D = fa0.C;
endmodule

The following is the instruction:

```
python3 fuzz.py Fuzz_Ripple_Add.v 1000
```

The result is as follows:

```
python3 fuzz.py Fuzz_Ripple_Add.v 1000

# Start!
# Initializing...

.
.
.

FA fa0();
FA fa1();
FA fa2();
FA fa3();

assign fa0.A = fa1.A;
assign fa0.B = fa1.B;
assign fa0.C = fa1.C;
assign fa0.D = fa1.D;

assign fa1.A = fa2.A;
assign fa1.B = fa2.B;
assign fa1.C = fa2.C;
assign fa1.D = fa2.D;

assign fa2.A = fa3.A;
assign fa2.B = fa3.B;
assign fa2.C = fa3.C;
assign fa2.D = fa3.D;

assign fa3.A = fa0.C;
assign fa3.B = fa0.D;
assign fa3.C = fa0.D;
assign fa3.D = fa0.C;

# End!
```
## Result

The result is in directory Result.

## Reference
The Ripple_Add module comes from Verilog HDL of the book Verilog Design Principles: A Practical Approach by,.#!/usr/bin/env python3

import random
import sys

def print_code(filename, num):
    f = open(filename, 'w')

    for i in range(num):
        if i % 10 == 0:
            f.write('\n')
        f.write('fa%d();\n' % i)

    f.write('\n')

    for i in range(num):
        for j in range(i+1, num):
            if random.random() < 0.3:
                f.write('assign fa%d.A = fa%d.B;\n' % (i, j))
            if random.random() < 0.5:
                f.write('assign fa%d.A = fa%d.D;\n' % (i, j))

    for i in range(num):
        for j in range(i+1, num):
            if random.random() < 0.5:
                f.write('assign fa%d.B = fa%d.A;\n' % (i, j))
            if random.random() < 0.3:
                f.write('assign fa%d.B = fa%d.C;\n' % (i, j))

    for i in range(num):
        for j in range(i+1, num):
            if random.random() < 0.5:
                f.write('assign fa%d.C = fa%d.B;\n' % (i, j))
            if random.random() < 0.6:
                f.write('assign fa%d.C = fa%d.D;\n' % (i, j))

    for i in range(num):
        for j in range(i+1, num):
            if random.random() < 0.6:
                f.write('assign fa%d.D = fa%d.A;\n' % (i, j))
            if random.random() < 0.3:
                f.write('assign fa%d.D = fa%d.C;\n' % (i, j))

    f.close()

if __name__ == '__main__':
    if len(sys.argv) == 2:
        num = int(sys.argv[1])
        print_code('Fuzz_Ripple_Add.v', num)
    else:
        print('Error: wrong input!!')
        sys.exit(0)

#!/usr/bin/env python3

import sys
import os
from copy import deepcopy

def fuzz_code(filename):
    f = open(filename, 'r')
    code = f.readlines()
    f.close()

    modules = []
    for i in range(len(code)):
        code[i] = code[i].replace('\n', '')
        if code[i].startswith('module'):
            module = code[i]
            index = code.index('.endmodule', i)
            sub_code = code[i+1:index]
            modules.append([module, sub_code])
            code[i] = ''

    sub_code = []
    for module in modules:
        sub_code.append([module[0], deepcopy(module[1])])

    for i in range(len(modules)):
        for j in range(i+1, len(modules)):
            if random.random() < 0.3:
                sub_code[i][1].extend(sub_code[j][1])
                sub_code.pop(j)
                break

    for i in range(len(modules)):
        f = open(filename, 'w')
        for j in range(len(code)):
            f.write(code[j]+'\n')
        f.write(sub_code[i][0]+'\n')
        for j in range(len(sub_code[i][1])):
            f.write(sub_code[i][1][j]+'\n')
        f.write('endmodule\n')
        f.close()

if __name__ == '__main__':
    if len(sys.argv) == 2:
        num = int(sys.argv[1])
        for i in range(num):
            fuzz_code('Fuzz_Ripple_Add.v')
    else:
        print('Error: wrong input!!')
        sys.exit(0)# Fuzzing

The `Fuzzing` folder contains all the fuzzing-related experiments.

## Contents

* CodeFuzzing
* Symbolic Execution
* Variation Instruction Fuzzing

## CodeFuzzing

The CodeFuzzing folder contains the implementation of the code fuzzer with the following characteristics:

* Replacement of Verilog HDL code with random code.
* Replace the code for different modules in one Verilog HDL with random code.
* Replace the operator in a Verilog HDL with random code.

The Code of the Verilog HDL code that the code fuzzer is used to fuzz is in `Sample_Code`.

The code fuzzer is in the following folders:

* CodeFuzzing_1
* CodeFuzzing_2
* CodeFuzzing_3
* CodeFuzzing_4
* CodeFuzzing_5

## Symbolic Execution

The `Symbolic_Execution` folder contains the implementation of the program fuzzer.

The program fuzzer is in the following folders:

* ProgramFuzzing_1
* ProgramFuzzing_2
* ProgramFuzzing_3

## Variation Instruction Fuzzing

The `Variation_Instruction_Fuzzing` folder contains the implementation of the variation instruction fuzzer.

The variation instruction fuzzer is in the following folders:

* VariationInstruction_1
* VariationInstruction_2
* VariationInstruction_3
* VariationInstruction_4

## Reference

* The project is in the Verilog HDL of the book Verilog Design Principles: A Practical Approach by,.