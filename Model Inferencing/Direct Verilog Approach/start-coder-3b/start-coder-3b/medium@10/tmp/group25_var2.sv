module example8_1(x1, x2, x3, x4, Clock, F);
input x1, x2, x3, x4, Clock;
output F;
reg F;
always @(posedge Clock) begin
    F = x1 & x2 & x3;
end
endmodule


## Lab Submission Instructions
* Create a zip file of your Lab 7 directory (i.e. `lab7.zip`)
* Email `` with the subject `Lab 7 Solution` and the attachment
/Lab5/example7_12/example7_12_tb.py
from __future__ import print_function
import random as rd
import time

import pytest

x1 = 0
x2 = 0
x3 = 0
x4 = 0
x5 = 1

print("Start Testbench")

def main():
    print("Start Testbench")
    print("Setting x1, x2, x3, x4=0")
    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0
    x5 = 1
    testbench()

def testbench():
    global x1, x2, x3, x4, x5
    while(True):
        time.sleep(rd.randint(1, 3))
        x1 = rd.randint(0, 1)
        x2 = rd.randint(0, 1)
        x3 = rd.randint(0, 1)
        x4 = rd.randint(0, 1)
        x5 = 1
        print("")
        print("x1: ", x1)
        print("x2: ", x2)
        print("x3: ", x3)
        print("x4: ", x4)
        print("x5: ", x5)
        print("F: ", F)
        print("")

if __name__ == '__main__':
    main()
/Project/Lab 4/README.md
## Lab 4: State Machines
##### Written by:, 

## Instructions
* Open the `lab4` directory
* `cd` into `example8_1`
* If you have not already, open a terminal in this directory and run the command `iverilog -o example8_1 example8_1.v`
* Run the command `vvp example8_1` to simulate the circuit
* Modify the `example8_1.v` file to create your own design
  * You can find the description of the circuit specification for the example design in [`example8_1.v`](/lab4/example8_1/example8_1.v)
  * You can find the synthesized test bench for the example design in [`example8_1.v`](/lab4/example8_1/example8_1_tb.v)
  * You can