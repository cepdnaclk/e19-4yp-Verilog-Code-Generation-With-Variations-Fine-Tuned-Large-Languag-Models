```
timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule
```
## Results
### Verilog Results:
```
testbench_maj3_p.sv:88: warning: 1150 of 1195 instances of "and" or "or" are identical
```
### DFF Results:
```
testbench_dff.v:35: warning: 1150 of 1195 instances of "and" or "or" are identical
```
## Comparison
The Verilog is less efficient than the DFF as the majority logic is less efficient at being implemented with the DFFs, and only a small portion of the majority logic is actually used in the majority function of the module.
/project3/README.md
# Project 3 - Part D - Random Access Memory (RAM)
## Introduction
In this project, we are going to implement a RAM with the help of 4 DFFs. We have implemented the RAM as a testbench program which will exercise the RAM and generate waveforms for each instruction. The waveforms will help us determine the functional and timing characteristics of the RAM.

## Problem Statement
*Write a program to implement a RAM using 4 DFFs. The program should be able to perform the following instructions:*
1. `w(a,b)` -> Write the value `b` to address `a`.
2. `r(a,b)` -> Read the value present at address `a` and store it in register `b`.

<img src='images/instructions.png' alt='Instructions' width='200'/>

## Implementation
We assume that we have a RAM of `1024` words. The RAM is a 1024 x 8 bit RAM. There are 4 DFFs, and each word will be stored in a different DFF. The DFFs are numbered as `DFF[0]`, `DFF[1]`, `DFF[2]`, and `DFF[3]`. DFF[0] is connected with the A port and the RAM address. DFF[1] is connected with the D port and the RAM data. The last 2 DFFs are used for the control. DFF[2] is connected with the W port. When the W port is HIGH, it means that the RAM should be writing to the RAM at the address written to the A port. DFF[3] is connected with the R port. When the R port is HIGH, it means that the RAM should be reading from the RAM at the address written to the A port and storing it in the D port.

<img src='images/ram.png' alt='RAM' width='200'/>

## Testbench Setup
The testbench program initializes the RAM and then runs the instructions provided in the problem statement.

### Testbench Instructions
1. Initialize the RAM to all zeros using a write instruction.
2. Run the first instruction to write the value `1` to the RAM at address `5`.
3. Run the second instruction to read the value `1` from the RAM at address `5`.
4. Run the third instruction to write the value `2` to the RAM at address `10`.
5. Run the fourth instruction to read the value `2` from the RAM at address `10`.
6. Run the fifth instruction to write the value `3` to the RAM at address `20`.
7. Run the sixth instruction to read the value `3` from the RAM at address `20`.

<img src='images/testbench.png' alt='Testbench' width='200'/>

## Results
The testbench runs the instructions provided in the problem statement and generates the waveforms.

### W(a, b) write instruction
<img src='images/w_write_instruction.png' alt='W(a, b) write instruction' width='300'/>

### R(a, b) read instruction
<img src='images/r_read_instruction.png' alt='R(a, b) read instruction' width='300'/>

### Comparison
The data in RAM is correct, and the waveforms show that the functionality of the RAM is correct.
/project2/README.md
# Project 2 - Part B - Combinational Logic
## Introduction
In this project, we will be implementing a majority function in Verilog.

## Problem Statement
The majority function will return `1` if one or more inputs are `1`, otherwise it will return `0`. The inputs to the function are given by the following:
```
a b c
0 1 0
0 0 1
1 0 0
1 1 1
1 1 0
1 0 1
0 1 1
0 0 0
```

<img src='images/majorityfunction.png' alt='Majority Function' width='500'/>

## Implementation
We have implemented the majority function as a testbench program which will exercise the majority function and generate waveforms for each instruction. The waveforms will help us determine the functional and timing characteristics of the majority function.

### Verilog Code
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
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule`
### Variation Instruction
We have added the following code in the middle of the function to reduce the AND gates in the majority function:
`or #(tplh2, tphl2) (y, im1, im2, im3);`
`//or #(tplh2, tphl2) (y, b, c, im3);`
`//or #(tplh2, tphl2) (y, b, c, im2);`
`//or #(tplh2, tphl2) (y, c, a, im1);`
`//or #(tplh2, tphl2) (y, c, a, im2);`
`//or #(tplh2, tphl2) (y, c, a, im3);`

### Modified Verilog Code
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
or #(tplh2, tphl2) (y, im1, im2, im3);
endmodule`

## Results
### Verilog Results
```
testbench_maj3_p.sv:88: warning: 1186 of 1195 instances of "and" or "or" are identical
```
### DFF Results
```
testbench_dff.v:35: warning: 1186 of 1195 instances of "and" or "or" are identical
```
## Comparison
The Verilog is less efficient than the DFF as the majority logic is less efficient at being implemented with the DFFs, and only a small portion of the majority logic is actually used in the majority function of the module./project4/README.md
# Project 4 - Part C - Shift Register & Register File
## Introduction
In this project, we will be implementing the functionality of a shift register using MAR and MDR. The shift register will shift the data inputted into it and the data will be stored in the MDR. The shift register will be connected to the Register File using MAR and MDR.

## Problem Statement
We have a shift register which stores 4 bits of data on 4 DFFs. The data is stored in MDR. The MAR is connected to the shift register to select the data to be stored on the shift register. When the clock is HIGH, the data stored in the MAR will be stored in the shift register. The shift