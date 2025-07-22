module Counter (input clk, [2:0] d, output [4:0] q);
reg [4:0] q;

## Code Review
### Comments:
* There are a few things to keep in mind as you add more tests (e.g. to add more tests, you may want to think about adding a test that checks the output of a register before writing to it).

* To make sure that you have enough tests, try to get a coverage of 70%.

### Candidate for Next Assignment
If you believe that you have created a candidate for the next assignment (which you should have), please fill out a new google form. See the instructions [here](https://www.google.com/forms/d/e/1FAIpQLSegO6v6r4o_5s0eX48J793OJ2gS35_5hN7o8g/viewform?usp=sf_link).

### Academic Honesty
Please review the [Academic Honesty](http://www.cs.cmu.edu/~11211/honesty/) page during the period you are taking classes.

### Submission Instructions
If something is missing from your submission please post on the course Piazza page or email the TA.
Please go to the [Submission Instructions](http://www.cs.cmu.edu/~11211/assignments/assignment3/) page for additional instructions.

### Honor Code
You must agree with the Honor Code for this course. Please review the [Honor Code](http://www.cs.cmu.edu/~11211/honor/index.html) page for details.

### Help
This is a challenging assignment and a lot of work has gone into it. If you need any help, please come to office hours or send an email to any of the course staff.

### Grade Breakdown
* 10%: Style
* 10%: Code Quality
* 80%: Code Functionality

### Final Grade
# CMU 11-211: 2016-2017
## Assignment #5: Testing with Stimulus
### Instructor: 
### Author: 

## Overview
The last assignment was all about writing testbenches. In reality, writing a good testbench for a hardware module can be a daunting task. The reason is that we need to include signals in the testbench that are not in the circuit under test. Writing the most general testbench is a daunting task. The other reason is that you may need to include many test vectors. As you add more and more test vectors, the testbench code will become cluttered and hard to follow. To help with this problem, you will implement the testbench by using a stimulus generation script. In this assignment you will learn how to use a stimulus generation script to generate large numbers of test vectors.

## Assignment Description
### Purpose: 
In this assignment you will practice using a stimulus generation script to generate test vectors. Before, you wrote a testbench for a circuit that takes 2 input bits and returns 1 output bit. In this assignment you will use a stimulus generation script to generate a large number of test vectors for a larger circuit. The circuit you will use is the 5-bit binary counter that you implemented in the last assignment. The testbench should take a 5-bit vector as input and return 5 bits as output. You will also need to generate a lot of test vectors. You may find it useful to generate a random 5-bit vector each time you run the testbench.

### Requirements:
The purpose of this assignment is to help you learn how to generate test vectors for a large circuit. You will implement a testbench for the binary counter you wrote in the last assignment. You can use the code below to start your implementation of the binary counter testbench.

### Grading:
For this assignment you will need to submit the following items:
* Your binary counter testbench file.

Please review the Submission Instructions [here](http://www.cs.cmu.edu/~11211/assignments/assignment5/).

### Instructions:

### Base Verilog Code:
module Counter (input clk, [2:0] d, output [4:0] q);
reg [4:0] q