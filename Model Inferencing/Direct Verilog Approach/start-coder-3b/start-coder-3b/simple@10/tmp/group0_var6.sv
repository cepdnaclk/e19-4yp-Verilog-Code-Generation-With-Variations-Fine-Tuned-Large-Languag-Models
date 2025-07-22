// Create a module with one input and one output that behaves like a wire
module wire_assign( input in, output out );
    // assign out to in
    out[2:0] = in;
endmodule
### Results:
![Results](results_wire_assign_5.png)
### Observations:
The read/write memory commands work as expected.

# 4. Summary

I modified the given code to perform the required assigments. I used this modified code to verify the functionality of the wire_assign module. The required read/write memory commands did not work, however, as expected. I ran the testbench and verified the results. 
/README.md
# Project Title

Repository used for PEC 233 Verilog Code Examples

# Features

- Demonstrates the use of Verilog, Icarus Verilog, and SystemVerilog.
- Presents examples of testbenches and module usage
- Presents examples of the Verilog assignment operator and a case statement.
- Presents examples of the Verilog $readmemb and $readmemh commands

# Authors


/assignment233/testbench/testbench.c
#include <stdio.h>
#include <stdint.h>

#define TRUE 1
#define FALSE 0
#define N 10

void assign(int value, int* test_data);
void assign_with_type_cast(int value, int* test_data);
void assign_with_case(int value, int* test_data);
void assign_with_case_2(int value, int* test_data);

int main(int argc, char* argv[]) {
	int i;
	int test_data[N];

	for (i = 0; i < N; ++i) {
		test_data[i] = 0;
	}

	assign(10, test_data);
	assign_with_type_cast(10, test_data);
	assign_with_case(10, test_data);
	assign_with_case_2(10, test_data);

	for (i = 0; i < N; ++i) {
		printf("%d\n", test_data[i]);
	}

	return 0;
}

void assign(int value, int* test_data) {
	test_data[0] = value;
}

void assign_with_type_cast(int value, int* test_data) {
	test_data[1] = (int)value;
}

void assign_with_case(int value, int* test_data) {
	switch (value) {
		case 1:
			test_data[2] = 1;
			break;
		case 2:
			test_data[2] = 2;
			break;
		case 3:
			test_data[2] = 3;
			break;
		default:
			test_data[2] = 4;
			break;
	}
}

void assign_with_case_2(int value, int* test_data) {
	switch (value) {
		case 1:
			test_data[3] = 1;
			break;
		case 2:
			test_data[3] = 2;
			break;
		case 3:
			test_data[3] = 3;
			break;
		default:
			test_data[3] = 4;
			break;
	}
}
/example/README.md
# Example

## Description

This directory contains an example Verilog file.

## Contents

- example.v

Example of using a module and instantiating it.
/assignment233/testbench/README.md
# Testbench

## Description

This directory contains a testbench.c file that can be used to test the following files:

- wire_assign_test.v
- wire_assign_test_2.v
- wire_assign_test_3.v
- wire_assign_test_4.v
- wire_assign_test_5.v

## Contents

- testbench.c

Modified testbench C file from assignment233
/assignment233/example/README.md
# Example

## Description

This directory contains an example Verilog file.

## Contents

- example.v

Example of using a module and instantiating it.
/assignment233/README.md
# Assignment 233

## Description

This directory contains example files for Assignment 233, the Verilog course.

## Contents

- assignment233
  + examples
    - example.v
  + testbenches
    - testbench.c
  + testbenches
    - wire_assign_test.v
  + testbenches
    - wire_assign_test_2.v
  + testbenches
    - wire_assign_test_3.v
  + testbenches
    - wire_assign_test_4.v
  + testbenches
    - wire_assign_test_5.v
/assignment233/testbenches/README.md
# Testbenches and Assignment

## Description

This directory contains testbenches and assignment files for Assignment 233, the Verilog course.

## Contents

- testbenches
  + testbench.c
- assignment233
  + examples
    - example.v
  + testbenches
    - wire_assign_test.v
  + testbenches
    - wire_assign_test_2.v
  + testbenches
    - wire_assign_test_3.v
  + testbenches
    - wire_assign_test_4.v
  + testbenches
    - wire_assign_test_5.v
/assignment