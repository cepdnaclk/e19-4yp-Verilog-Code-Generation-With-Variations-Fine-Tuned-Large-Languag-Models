`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
wire [1:0] im1_y;
and #(tplh2, tphl2) (im1_y[0], im1, im2, im3);
or #(tplh2, tphl2) (y, im1_y[0], im1_y[1]);
endmodule
`
/README.md
# ECE 531 - Digital Design with Verilog
## Course Description
This course is an introduction to the design of digital systems using the industry-standard Verilog language. In this course, we will learn the design methodology, as well as the tools used to construct digital systems. Students will learn to write Verilog code, and will be introduced to Verilog's basic digital components. A software environment for learning Verilog will be presented. Students will learn how to use a HDL simulator to simulate and test their designs as they are developing them. Students will be introduced to the use of the industry-standard testbench for Verilog. Students will learn how to test concurrent logic.

## Course Objectives
This course is designed to give students an introduction to the design of digital systems using the industry-standard Verilog language. Students will be introduced to Verilog's basic components and the software environment to use Verilog. Students will be able to:
* Implement digital circuits using synchronous combinational logic 
* Identify the basic elements of Verilog
* Use the Verilog simulator to simulate system behavior
* Implement a testbench for Verilog
* Implement a simple sequential circuit using flip-flops
* Implement a simple counter using clock-enable flip-flops
* Implement a simple counter using up and down counter circuits
* Implement a simple counter using a combinational logic counter

## Grade
This course is a three-credit course, and is divided into two sections: a lecture-style section (300-level) and a lab-style section (310-level). The lecture-style section will have a 45 minutes per week of lecture to introduce new concepts and features of Verilog. The lab-style section will have 3-4 hours of lab time per week, with one week having two sections.

## Grading
This course is offered in a three-credit format, and is divided into two sections. Each section will be graded as follows:
* 30% - Quizzes and Participation
* 30% - Labs
* 40% - Exams

## Textbooks
This course will use the following textbook.
* *Verilog HDL: A Quick and Dirty Guide* by, O'Reilly, 2003, 3rd edition


## Exams
There will be one midterm and one final exam. The final exam will be cumulative.

## CSU Grade Scale
* 90 - 100 - A
* 80 - 89 - B
* 70 - 79 - C
* 60 - 69 - D
* 0 - 59 - F
/Lecture 3/Lab 3.4 - 3.6/README.md
# Lab 3.4 - 3.6
## Exercises
### Exercise 3.4
Create a block diagram of the adder circuit.
### Exercise 3.5
Create a block diagram of the multiplier circuit.
### Exercise 3.6
Create a block diagram of the multiplexer circuit.
/Lecture 5/README.md
# Lecture 5
## Exercise 3.8
### Exercise 3.8.1
Construct a truth table for the following function-call statement:
`assign i_out = i_in + 3;`
Use the following truth table as a starting point:
`10 100 101 110 111 1000 1001 1010 1011 1100 1101 1110 1111`
### Exercise 3.8.2
Construct a truth table for the following function-call statement:
`assign i_out = i_in * 3;`
Use the following truth table as a starting point:
`10 100 101 110 111 1000 1001 1010 1011 1100 1101 1110 1111`
### Exercise 3.8.3
Construct a truth table for the following function-call statement:
`assign i_out = i_in -3;`
Use the following truth table as a starting point:
`10 100 101 110 111 1000 1001 1010 1011 1100 1101 1110 1111`
/Lecture 2/README.md
# Lecture 2
## Exercise 3.1.1
### Exercise 3.1.1.1
Construct the following circuit using a full adder.
![Full Adder](Images/Full Adder.png)
### Exercise 3.1.1.2
Construct the following circuit using a half adder.
![Half Adder](Images/Half Adder.png)
### Exercise 3.1.1.3
Construct the following circuit using the full adder and half adder.
![Full Adder and Half Adder](Images/Full Adder and Half Adder.png)
### Exercise 3.1.1.4
Construct the following circuit using a full adder and a half adder.
![Full Adder and Half Adder](Images/Full Adder and Half Adder.png)
## Exercise 3.1.2
### Exercise 3.1.2.1
Construct the following circuit using a full adder.
![Full Adder](Images/Full Adder.png)
### Exercise 3.1.2.2
Construct the following circuit using a half adder.
![Half Adder](Images/Half Adder.png)
### Exercise 3.1.2.3
Construct the following circuit using the full adder and half adder.
![Full Adder and Half Adder](Images/Full Adder and Half Adder.png)
### Exercise 3.1.2.4
Construct the following circuit using a full adder and a half adder.
![Full Adder and Half Adder](Images/Full Adder and Half Adder.png)
/Lecture 1/README.md
# Lecture 1
## Exercise 3.1.1
### Exercise 3.1.1.1
Construct the following circuit using only NAND gates.
![NAND Circuit 1](Images/3_1_1_1.png)
### Exercise 3.1.1.2
Construct the following circuit using only NOR gates.
![NOR Circuit 1](Images/3_1_1_2.png)
### Exercise 3.1.1.3
Construct the following circuit using only AND/OR gates.
![AND/OR Circuit 1](Images/3_1_1_3.png)
## Exercise 3.1.2
### Exercise 3.1.2.1
Construct the following circuit using only NAND gates.
![NAND Circuit 2](Images/3_1_2_1.png)
### Exercise 3.1.2.2
Construct the following circuit using only NOR gates.
![NOR Circuit 2](Images/3_1_2_2.png)
### Exercise 3.1.2.3
Construct the following circuit using only AND/OR gates.
![AND/OR Circuit 2](Images/3_1_2_3.png)
## Exercise 3.1.3
### Exercise 3.1.3.1
Construct the following circuit using only NAND gates.
![NAND Circuit 3](Images/3_1_3_1.png)
### Exercise 3.1.3.2
Construct the following circuit using only NOR gates.
![NOR Circuit 3](Images/3_1_3_2.png)
### Exercise 3.1.3.3
Construct the following circuit using only AND/OR gates.
![AND/OR Circuit 3](Images/3_1_3_3.png)
/Lecture 3/README.md
# Lecture 3