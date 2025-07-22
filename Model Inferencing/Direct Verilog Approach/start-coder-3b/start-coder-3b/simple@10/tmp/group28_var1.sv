- Use the module name of example2 for the unpacked dimension (module name is also the variable name).
- Assign the variable name of the wire array to the corresponding signal name in the Verilog code.
- Modify the assign statement to enable the Verilog code to pass the verification.

---
### Problem 3:
This is another variant of the previous problem, where the first bit of the two input variables is used as a control bit. The control bit only accepts the values 0 and 1, and the operation performed by the module is either Add or Subtract depending on the value of the control bit.

### Base Verilog Code:
module example4(Data1, Data2, Clock, Reset, ControlBit, AddBit, Result1, Result2);
input Clock, Reset;
input [3:0] Data1, Data2;
input ControlBit;
output [3:0] Result1, Result2;
reg4 R1 (Result1, Clock, Reset, AddBit);
reg4 R2 (Result2, Clock, Reset, AddBit);
wire AddBit;
assign AddBit = (ControlBit == 0);
assign Result1 = (AddBit? (Data1 + Data2) : (Data1 - Data2));
assign Result2 = (AddBit? (Data1 + Data2) : (Data1 - Data2));
endmodule
### Variation Instruction:
- Use the operator module name to assign the control bit name to the corresponding variable in the Verilog code.
- Assign the variable name of the control bit to the corresponding signal name in the Verilog code.
- Modify the assign statement to enable the Verilog code to pass the verification.

---
### Problem 4:
This problem is similar to the previous problem, but this time the operands are both multiplexed from another module.

### Base Verilog Code:
module example5(Operand1, Operand2, Clock, Reset, ControlBit, Result);
input Clock, Reset;
input [3:0] Operand1, Operand2, ControlBit;
output [3:0] Result;
reg4 R1 (Result, Clock, Reset, ControlBit);
wire ControlBit;
assign ControlBit = (ControlBit == 0);
assign Result = (ControlBit? (Operand1 * Operand2) : (Operand1 + Operand2));
endmodule
### Variation Instruction:
- Use the module name of example3 for the unpacked dimension (module name is also the variable name) of the input operands.
- Assign the variable name of the operand to the corresponding signal name in the Verilog code.
- Modify the signal assignment statements to enable the Verilog code to pass the verification.---
title: "EECS 340: Computer System Organization"
date: 2020-06-09
output: html_document
layout: post
---

# EECS 340: Computer System Organization
## Instructor: 
## Course Information: 
- Professor: 
- Time: MW 12:00pm - 2:00pm
- Location: Gibson 3030
- Office Hours: T 2:00pm - 3:00pm, W 1:00pm - 2:00pm

## Announcements
- Due next Tuesday (6/10) to submit the [Lab 8](https://github.com/michael-zhong-1/EECS-340-Computer-System-Organization/blob/master/Lab-8-Simulator-Lab/Lab-8-Simulator-Lab.pdf) and [Lab 9](https://github.com/michael-zhong-1/EECS-340-Computer-System-Organization/blob/master/Lab-9-Simulator-Lab/Lab-9-Simulator-Lab.pdf) simulator.
- No new instructor is scheduled for the next time.
- No new lab is scheduled for the next time.
- Please prepare in advance for the **mid-term test** from this week (6/14).
- Please prepare in advance for the **final exam** from this week (6/14).

## Topics
- Basic instruction set architecture (ISA)
- Registers
- MIPS ISA
- MIPS Instruction Format
- MIPS Pipeline
- MIPS CPU
- Computer architecture
- CPU performance
- Multi-processor system
- Data
- Virtual memory
- Cache
- Memory hierarchy
- Data path
- Microprocessor
- ALU
- Floating point
- Arithmetic and Logic Unit (ALU)
- Register file
- Control unit
- Register file
- ALU
- Pipeline
- Fetch operation
- Execute operation
- Memory access operation
- Write-back operation
- Memory
- Memory address
- Memory access
- Cache
- Cache operation
- Virtual memory
- Page table
- Page size
- Virtual memory
- Cache vs. virtual memory
- Cache replacement
- CPU
- Clock cycle
- CPI
- CPI
- TLB
- TLB hit or miss
- TLB translation
- TLB replacement

## Text
- Computer Organization and Design (3rd Edition),,, and 
- Computer Architecture: A Quantitative Approach (3rd Edition),,,,, and 
- Computer Organization in Action (3rd Edition), 
- The Hardware/Software Interface, by 

## Lab
- Lab 1 to Lab 7

## Homework
- Homework 1 to Homework 3

## References
- https://www.cs.umd.edu/~pugh/java/memoryModel/jsr-133-faq.html
- https://www.cs.umd.edu/~pugh/java/memoryModel/jsr-133-faq.html#synchronizationVsLocking
- https://www.javaworld.com/article/2076313/core-java/locks-vs-synchronizers.html
- https://www.oreilly.com/library/view/java-performance/0596003994/ch07.html

## Schedule
|Date|Activity|Week|
|:---:|:---|:---:|
|5/30|Mid-term test|1|
|6/1|Lab 0: Basic Java syntax|2|
|6/6 - 6/10|Lab 1 to Lab 7|2|
|6/14|Mid-term test|3|
|6/21 - 6/27|Lab 8 to Lab 10|3|
|6/28|Final exam|3|