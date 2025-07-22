module AndOr (output X, Y, input A, B, C);
bit [A:0] X;
bit [3:0] Y;
assign X = B;
assign Y = B | C;
endmodule

## Test Cases

The system tests the modified code to test the behavior of the code and check if the verilog is synthesizable. These tests are automated, so after making a change to the code you can re-run the tests and check if they are passed in a new branch.

## System Design

There are two sections in the code to get the design working:

1. The SystemVerilog code that will be tested.
2. The modified code that will be used to test the SystemVerilog code.

### SystemVerilog Code

The SystemVerilog code is to be tested. The testbench is generated from the SystemVerilog code and runs through the SystemVerilog code.

### Modified Code

The modified code is to be used to test the SystemVerilog code. The testbench is generated from the modified code and runs through the modified code. This modified code will be used to test both the SystemVerilog code and the modified SystemVerilog code.

## Instructions for Using the Script

To use the script:

* Add the testbench template to your repository.
* Write the SystemVerilog code.
* Write the modified code.
* Modify the test script to suit your code.
* Modify the test script to pass in your repository name and the test bench.
* Run the script.
# SystemVerilog Test Bench

A test script that can be used to test the SystemVerilog code.

## Test Bench Template

* [test_template](test_template.sv)

## Test Bench

The template is used to generate a testbench for the SystemVerilog code. The testbench will test the SystemVerilog code and the modified code.

## Usage

This script will test two different versions of the modified code. The two versions are the modified code and the modified SystemVerilog code.

The script can be run from the command-line.

The script takes four command-line arguments:

* **repo_name**   : The name of the repository.
* **repo_url**    : The URL of the repository.
* **test_bench**  : The name of the test bench.
* **system_bench** : The name of the SystemVerilog test bench.

The script will test two versions of the modified code.

### Test Bench

The test bench will test the SystemVerilog code and the modified code.

### SystemVerilog Test Bench

The SystemVerilog test bench will test the modified code and the modified SystemVerilog code.

## Instructions for Using the Script

To use the script:

* Add the test_template.sv to your repository.
* Write the SystemVerilog code.
* Write the modified code.
* Modify the test.sh to suit your code.
* Modify the test.sh to pass in your repository name, the test bench, and the SystemVerilog test bench.
* Run the script.
# SystemVerilog

A repository to learn about SystemVerilog.

## Test Bench

* [test_bench](test_bench/)

## System Design Example

* [design_example](design_example/)

## Test Case Example

* [test_case_example](test_case_example/)

## Test

* [test](test/README.md)

## SystemVerilog Tutorial

* [SystemVerilog Tutorial](https://www.educative.io/courses/systemverilog-fundamentals)

## Test Bench Template

* [test_template](test_template.sv)

## Test Bench

The template is used to generate a testbench for the SystemVerilog code. The testbench will test the SystemVerilog code and the modified code.

## Usage

This script will test two different versions of the modified code. The two versions are the modified code and the modified SystemVerilog code.

The script can be run from the command-line.

The script takes four command-line arguments:

* **repo_name**   : The name of the repository.
* **repo_url**    : The URL of the repository.
* **test_bench**  : The name of the test bench.
*