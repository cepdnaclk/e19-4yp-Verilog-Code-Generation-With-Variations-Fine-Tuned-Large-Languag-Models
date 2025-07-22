module latch (input d, c, output reg [7:0] q, q_b );
always begin
wait ( c );
end
endmodule
### Test File:
latch_test.v

```

### Running the Test
Run the test using the following command:
```
% make test
```

The output should be similar to the following:

<img src="latch_test.png" alt="Screen Shot 2022-03-09 at 1 39 27 PM" width="400" >

### Test Results
The test passes if no errors are detected.

## Lab 7: Behavioral Verilog

### Objective
Objective: This lab will introduce the use of assignment statements, blocking and non-blocking assignments, and basic timing constructs.

### Lab Overview

This lab will give you the opportunity to practice writing a behavioral Verilog 3.x code. For the behavioral code, the task will be to implement a simple ALU (arithmetic logic unit).

### Getting Started
Create the required files for the lab by running the following command:
```
% make
```

The test file is located in:
```
% cd./src/testbench/behavioral
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% ls -l
%  -rw-r--r-- 1 mschult  mschult   1518 Mar  9 13:05 alu.v
%  -rw-r--r-- 1 mschult  mschult   1099 Mar  9 13:05 alu_tb.v
%  -rw-r--r-- 1 mschult  mschult   5621 Mar  9 13:05 gen_alu.sh
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% cd src/testbench
% ls -l
%  -rwxr-xr-x 1 mschult  mschult  11291 Mar  9 13:16 gen_alu_tb.sh
```

### Running the Test
Run the test using the following command:
```
% make test
```

The output should be similar to the following:

<img src="behavioral_alu_test.png" alt="Screen Shot 2022-03-09 at 1 47 47 PM" width="400" >

### Test Results
The test passes if no errors are detected.

## Lab 8: Behavioral Verilog

### Objective
This lab will introduce the use of procedural constructs, state machines and more advanced timing constructs.

### Lab Overview

This lab will give you the opportunity to practice writing a behavioral Verilog 3.x code. For the behavioral code, the task will be to implement a simple ALU (arithmetic logic unit).

### Getting Started
Create the required files for the lab by running the following command:
```
% make
```

The test file is located in:
```
% cd./src/testbench/behavioral
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% ls -l
%  -rw-r--r-- 1 mschult  mschult   1518 Mar  9 13:05 alu.v
%  -rw-r--r-- 1 mschult  mschult   1099 Mar  9 13:05 alu_tb.v
%  -rw-r--r-- 1 mschult  mschult   5621 Mar  9 13:05 gen_alu.sh
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% cd src/testbench
% ls -l
%  -rwxr-xr-x 1 mschult  mschult  11291 Mar  9 13:16 gen_alu_tb.sh
```

### Running the Test
Run the test using the following command:
```
% make test
```

The output should be similar to the following:

<img src="behavioral_counter_test.png" alt="Screen Shot 2022-03-09 at 1 55 04 PM" width="400" >

### Test Results
The test passes if no errors are detected.

## Lab 9: Behavioral Verilog

### Objective
This lab introduces the use of procedural constructs, state machines and more advanced timing constructs.

### Lab Overview

This lab will give you the opportunity to practice writing a behavioral Verilog 3.x code. For the behavioral code, the task will be to implement a simple ALU (arithmetic logic unit).

### Getting Started
Create the required files for the lab by running the following command:
```
% make
```

The test file is located in:
```
% cd./src/testbench/behavioral
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% ls -l
%  -rw-r--r-- 1 mschult  mschult   1518 Mar  9 13:05 alu.v
%  -rw-r--r-- 1 mschult  mschult   1099 Mar  9 13:05 alu_tb.v
%  -rw-r--r-- 1 mschult  mschult   5621 Mar  9 13:05 gen_alu.sh
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% cd src/testbench
% ls -l
%  -rwxr-xr-x 1 mschult  mschult  11291 Mar  9 13:16 gen_alu_tb.sh
```

### Running the Test
Run the test using the following command:
```
% make test
```

The output should be similar to the following:

<img src="behavioral_counter_test.png" alt="Screen Shot 2022-03-09 at 1 55 04 PM" width="400" >

### Test Results
The test passes if no errors are detected.

## Lab 10: Behavioral Verilog

### Objective

This lab introduces the use of procedural constructs, state machines and more advanced timing constructs.

### Lab Overview

This lab will give you the opportunity to practice writing a behavioral Verilog 3.x code. For the behavioral code, the task will be to implement a simple ALU (arithmetic logic unit).

### Getting started
Create the required files for the lab by running the following command:
```
% make
```

The test file is located in:
```
% cd./src/testbench/behavioral
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% ls -l
%  -rw-r--r-- 1 mschult  mschult   1518 Mar  9 13:05 alu.v
%  -rw-r--r-- 1 mschult  mschult   1099 Mar  9 13:05 alu_tb.v
%  -rw-r--r-- 1 mschult  mschult   5621 Mar  9 13:05 gen_alu.sh
```

The following files are automatically created in the src/testbench/behavioral directory:
```
% cd src/testbench
% ls -l
%  -rwxr-xr-x 1 mschult  mschult  11291 Mar  9 13:16 gen_alu_tb.sh
```

### Running the Test
Run the test using the following command:
```
% make test
```

The output should be similar to the following:

<img src="behavioral_counter_test.png" alt="Screen Shot 2022-03-09 at 1 55 04 PM" width="400" >

### Test Results
The test passes if no errors are detected.

## Lab 11: Behavioral Verilog

### Objective

This lab introduces the use of procedural constructs, state machines and more advanced timing constructs.

### Lab Overview

This lab will give you the opportunity to practice writing a behavioral Verilog 3.x code. For the behavioral code, the task will be to implement a simple ALU (arithmetic logic unit).

### Getting started
Create the required files for the lab by