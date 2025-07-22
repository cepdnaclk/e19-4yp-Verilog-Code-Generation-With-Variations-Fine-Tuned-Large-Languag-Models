module testbench ();
generate data;
process data;
endmodule
```

## What went well?
The use of a struct to create a randomized data member worked well and made it easy to create randomized data. The new code is much more compact and uses less lines of code.

## What could be improved?
We could add more cases to the switch statement and use a more intuitive name for the struct, but the code still works the way we want.

## Next Steps
In the future, we could make the randomized data more useful by assigning it to an output variable. After the randomized data is assigned to the variable, we would read the input signal and compare it to the randomized data to see if the randomization worked correctly.
/lab_04/README.md
# Lab 4: Test Pattern Generation
*,, 

## What went well?
The use of structs in a testbench was an awesome addition to the testbenches created in lab 3. We were able to add new tests that use the new code and create a variety of tests.

## What could be improved?
The main things that could be improved are in the code for the testbenches. The code for the test benches could be more efficient and less nested if we had more time. The tests could be more extensive to include more variations of the testing we did in lab 3.
/lab_02/README.md
# Lab 2: Test Benching
*,, 

## What went well?
We were able to work together and create a good testbench and code to test the Adder. The Adder works by adding a 32-bit number, but our code was able to handle any number of bits from 8 to 32.

## What could be improved?
We could improve the code by using a switch statement to choose the number of bits for the addition. The switch statement would simplify the code and reduce the number of lines of code. We would also add more tests to make the tests more exhaustive.

## Next Steps
In the next lab we will combine the code from this lab with the testbenches from lab 3 to create a complete testbench and test the Adder.
/lab_00/README.md
# Lab 0: Setup and Organization
*,, 

## What went well?
The work we did in this lab made it easy to get started with the labs so we could all work together. It also made it easier to understand which parts of the code and files were used by everyone for the labs.

## What could be improved?
The most obvious things that could be improved are the amount of white space we add at the end of the lines of code. The white space makes it more difficult to see the code and makes it less easy to read.

## Next Steps
In the next lab we will add more commenting to our code to make it easier for others to understand our code.
/lab_03/README.md
# Lab 3: Testbenches
*,, 

## What went well?
We were able to work together and create a good testbench for the Adder and Shift Register. The adder testbench was done with the help of a TA, while the shift register testbench was done alone.

## What could be improved?
Our testbench for the Adder is not great. The Adder takes 16 or 32 bits, but we could add a test for the case where the number of bits is between 16 and 32. This would allow us to test the case where the number of bits is in between. We could add more tests using the testbenches to make the testbenches more extensive and useful.

## Next Steps
In the next lab we will combine the code from this lab with the code in the next lab to create a complete testbench and test the Adder and Shift Register.
/README.md
# Software Testing and Verification
## Cornell CS 4700 Spring 2020

## Labs
* [Lab 0: Setup and Organization](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_00)
* [Lab 1: Introduction to Verilog](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_01)
* [Lab 2: Test Benching](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_02)
* [Lab 3: Testbenches](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_03)
* [Lab 4: Test Pattern Generation](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_04)
* [Lab 5: Randomization and Test Pattern Generation](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_05)
* [Lab 6: System Verilog](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_06)
* [Lab 7: Code Coverage](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_07)
* [Lab 8: Fault Injection](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_08)
* [Lab 9: Debugging Tools](https://github.com/william-dawson/Software-Testing-Verification/tree/master/lab_09)
/lab_06/README.md
# Lab 6: System Verilog
*,, 

## What went well?
The creation of the system verilog files was a fun challenge and a good learning experience.

## What could be improved?
The best thing to improve is the system verilog files. We should add more comments to the system verilog files.

## Next Steps
In the next lab we will create our own system verilog files for components we want to combine.
/lab_07/README.md
# Lab 7: Code Coverage
*,, 

## What went well?
The code coverage is working well and we were able to increase the code coverage.

## What could be improved?
There are a few things we could improve. The first is that the code coverage has not increased enough since it was initially implemented. The second thing we could work on is creating more tests to increase the code coverage. The third thing we could improve in the code coverage is the commenting. The commenting isn't great and it is a bit complicated. There are also a few warnings that can be removed.

## Next Steps
In the next lab we will use code coverage to create more tests to increase the code coverage.
/lab_09/README.md
# Lab 9: Debugging Tools
*,, 

## What went well?
We created the debug tools and they work well. The most difficult part was getting the address map, but we were able to find the bugs in our code.

## What could be improved?
The code for the debug tools is not great and it could be improved if we had more time. Another part that could be improved is the code coverage. The code coverage is not great and we would like to improve it. There are also a few warnings that can be removed.

## Next Steps
In the next lab we will debug the code so that the debug tools are as accurate as they can be.
/lab_08/README.md
# Lab 8: Fault Injection
*,, 

## What went well?
The use of fault injection using the debug tools was an awesome learning experience. The debugging tools worked well and we were able to find the bugs in our code.

## What could be improved?
The main thing that could be improved is that the bugs that we were able to find were not very useful. The debug tools don't tell us what the input is that caused the bug, so we wouldn't have been able to find the bug. We could improve the tools by adding more information about the input that caused the bug so we could find the bug easier.

## Next Steps
In the next lab we will use the debug tools to find more bugs in the code.