module muxdff(D0, D1, Sel, Clock, Q)
input D0, D1, Sel, Clock;
output Q;
reg Q;
wire logic [7:0] sel_to_index = Sel;
always @(posedge Clock)
    if (!sel_to_index)
        Q <= D0;
    else
        Q <= D1;
endmodule
### Test Case:
muxdff
### Result:
10100001
/project_2/c/README.md
## C Code

### Base C Code
```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int a = 10;
	int b = 3;
	int c = a + b;
	printf("a + b = %d\n", c);
	return 0;
}
```

### Variation Instruction
Swap the `a` and `b` variables

### Modified Code
```c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int a = 3;
	int b = 10;
	int c = a + b;
	printf("a + b = %d\n", c);
	return 0;
}
```

### Test Case
10100010
/project_2/verilog/README.md
## Verilog Code

Note: The testbench file must end with `_test.v` to be recognized as a testbench.

### Base Verilog Code
```verilog
module main(input logic sigA, input logic sigB, output logic sigC);
	assign sigC = sigA + sigB;
endmodule
```

### Variation Instruction
Swap the `sigA` and `sigB` inputs of the module

### Modified Code
```verilog
module main(input logic sigB, input logic sigA, output logic sigC);
	assign sigC = sigA + sigB;
endmodule
```

### Test Case
10100101
/project_1/README.md
# Project 1: Verilog Verification

This project contains the base Verilog code, the modified code, and the test case for the Verilog code.

For more information on our project, go to: https://github.com/hci-4910/project_1/wiki
/project_2/README.md
# Project 2: C Verification

This project contains the base C code, the modified code, and the test case for the C code.

For more information on our project, go to: https://github.com/hci-4910/project_2/wiki
/project_1/README.md
# Project 1: Verilog Verification

This project contains the base Verilog code, the modified code, and the test case for the Verilog code.

For more information on our project, go to: https://github.com/hci-4910/project_1/wiki