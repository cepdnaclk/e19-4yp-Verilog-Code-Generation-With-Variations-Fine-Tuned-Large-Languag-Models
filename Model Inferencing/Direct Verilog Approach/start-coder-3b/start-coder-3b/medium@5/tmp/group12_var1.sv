module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
and #(2, 4) (im1, a, b),
    #(2, 4) (im2, b, c),
    #(2, 4) (im3, c, a);
or #(3, 5) (y, im1, im2, im3);
endmodule


/README.md
# Formal-Verification
Formal verification of a component using VUnit

## How to run
```
make test
```

## Requirements
```
python3.6+
```

## Description
This is an example of formal verification. For more information about the methodology used to accomplish the verification, see the [proposal](https://github.com/josephmarquez/Formal-Verification/blob/master/proposal/proposal.md).

The testbench is built in [Icarus Verilog](https://github.com/steveicarus/iverilog/wiki) and the test cases are written in [VUnit](https://github.com/VUnit/vunit).

## Structure
This repository is separated into the following folders:
### code/
  This folder contains the base code (v) and the target code (t), the result of the formal verification will be placed in the output folder.
### proposal/
  This folder contains the proposal for the formal verification of the design.
### results/
     This folder contains the design results.
### test/
  This folder contains the VUnit test cases.
/test/test_maj3.py
from vunit import VUnit
from vunit.verilog import VerilogTest
import os

def test_maj3():
    # create vunit test object
    testbench = VerilogTest()
    # create a module test
    tests = testbench.create_test("maj3")

    # read in base and target verilog files
    with open("code/maj3.v") as f:
        tests.base_content = f.read()
    with open("code/maj3_t.v") as f:
        tests.target_content = f.read()
    with open("code/maj3_out.v") as f:
        tests.expected_content = f.read()
    # compile the files
    testbench.compile()

    # execute the test case
    testbench.run(fail_on_error=True)
    if not os.path.isdir("results"):
        os.mkdir("results")
    if not os.path.isdir("results/maj3"):
        os.mkdir("results/maj3")
    # write a test case file
    tests.write_log("results/maj3/maj3.txt")

# run the vunit test
VUnit.main(test_maj3)
/test/test_maj6.py
from vunit import VUnit
from vunit.verilog import VerilogTest
import os

def test_maj6():
    # create vunit test object
    testbench = VerilogTest()
    # create a module test
    tests = testbench.create_test("maj6")

    # read in base and target verilog files
    with open("code/maj6.v") as f:
        tests.base_content = f.read()
    with open("code/maj6_t.v") as f:
        tests.target_content = f.read()
    with open("code/maj6_out.v") as f:
        tests.expected_content = f.read()
    # compile the files
    testbench.compile()

    # execute the test case
    testbench.run(fail_on_error=True)
    if not os.path.isdir("results"):
        os.mkdir("results")
    if not os.path.isdir("results/maj6"):
        os.mkdir("results/maj6")
    # write a test case file
    tests.write_log("results/maj6/maj6.txt")

# run the vunit test
VUnit.main(test_maj6)
/makefile
.PHONY: test

test:
	python3 test/test_maj3.py
	python3 test/test_maj6.py

clean:
	rm -rf results