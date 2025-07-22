module pulses; // Incorrect pulse generation attempt
  reg [31:0] I;
  reg a,b;
  initial
    while (I<100) begin // Loop based on integer I
      b = I[1+:3]; // Assign bits 1 through 3 of I to b
      I = I + 1; // Increment I
    end
  initial I=0; // Initialize I
  initial #100 $stop; // Stop simulation
endmodule

# References
[1] https://www.verilog.com/

[2] https://forums.xilinx.com/t5/ISE-Tools-Questions/Reaching-the-limit-of-the-range-of-array-slices/td-p/1091116

[3] https://forums.xilinx.com/t5/Verilog-Tools-and-Vivado/Verilog-Indexing-and-Slices/td-p/1090470

[4] http://www.asic-world.com/verilog/verilog.html

[5] http://www.asic-world.com/verilog/verilog_slices.html#slice_range

/CSE_3014_Lab_Exercises/Lab_1/lab1.sh
#!/bin/bash

#Lab1
#

for file in *.v
do
	echo "---------------------------------"
	echo "File: $file"
	echo "---------------------------------"
	echo "Simulation Results:"
	echo "---------------------------------"
	echo
	echo -e "VCOM: \n"
	vcom $file
	echo
	echo -e "VLOG: \n"
	vlog -work work $file
	echo
	echo -e "VSIM: \n"
	vsim -c -do $file -do "quit" -novopt
	echo
	echo "---------------------------------"
	echo "End of File $file Results"
	echo "---------------------------------"
done

/CSE_3006_Lab_Exercise_1/README.md
# CSE 3006 Lab 1


This lab exercise is to simulate the behavior of a MIPS processor after a series of instructions using the provided instruction set and a sample assembly language program, as well as simulate the same behavior for a larger, real-world assembly program.

The first MIPS processor, M1, is the smallest MIPS processor that can be found. The second MIPS processor, M2, is a more advanced MIPS processor. Both processors have the same instruction set as the provided instruction set.

It is expected that the sample assembly language source file, MIPS_Sample.asm, will be used with M1. The larger assembly language source file, MIPS_Big.asm, will be used with M2. The provided instruction set includes the following instructions:

* R-type instructions
* I-type instructions
* J-type instructions

The provided files, "mips_instr.dec" and "mips_registers.dec", are the binary descriptions of the instruction format and the register format, respectively.

The following table is a summary of the instruction set, where each column contains the opcode, the instruction format, and the operation performed. The table shows that R-type instructions are composed of an opcode, the register format, and the R-type operation. I-type instructions are composed of an opcode, the register format, and the I-type operation.

![Instruction Summary](./mips_instruction_summary.png)

# Instruction Set

Based on the provided instruction set, the first MIPS processor, M1, takes the following instruction-level trace:

![mips_instruction_summary](./mips_instruction_summary.png)

and produces the following MIPS instruction trace:

![instructions](./mips_instr_trace_m1.png)

MIPS_Sample.asm contains 10 instructions. The first two instructions, lui and addi, are added to produce the following MIPS instruction trace.

![MIPS_Sample](./mips_instr_trace_m1_sample.png)

The remaining instructions are executed to produce the following MIPS instruction trace.

![MIPS_Sample](./mips_instr_trace_m1_sample_2.png)

With the same MIPS instruction trace, MIPS_Big.asm contains about 130 instructions. 

![MIPS_Big](./mips_instr_trace_m2.png)

When MIPS_Big.asm is processed by the second MIPS processor, M2, the following instruction trace is produced.

![MIPS_Big](./mips_instr_trace_m2_big.png)

The opcode, operand 1, operand 2, and result registers are printed for each instruction. 

The following table is a summary of the instruction execution in the first MIPS processor, M1.

![Register Summary](./mips_register_summary_m1.png)

The following table is a summary of the instruction execution in the second MIPS processor, M2.

![Register Summary](./mips_register_summary_m2.png)

# References

[1] *CSE 3006 Lab 1* -, Dr., and Dr. -

https://moodle.cs.unb.ca/pluginfile.php/197658/mod_resource/content/1/CSE%203006%20Lab%201.pdf/CSE_3014_Lab_Exercises/Lab_3/README.md
# Lab 3


## Problem 1
### Verilog Code
module Test;
  reg D, Q;
  always
  begin
    if (D) begin
      Q = 1'b0;
    end else begin
      Q = 1'b1;
    end
  end
endmodule
### Simulation Results
![Question 1](./Q1.png)

### Verilog Code
module Test;
  reg D, Q;
  always
  begin
    if (D) begin
      Q = 1'b0;
    end else begin
      Q = 1'b1;
    end
  end
endmodule
### Simulation Results
![Question 2](./Q2.png)

### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    if (D) begin
      Q = 1'b0;
    end else begin
      Q = 1'b1;
    end
  end
endmodule
### Simulation Results
![Question 3](./Q3.png)

## Problem 2
### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    D = ~D;
  end
endmodule
### Simulation Results
![Question 4](./Q4.png)

### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    D = ~D;
  end
endmodule
### Simulation Results
![Question 5](./Q5.png)

## Problem 3
### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    D = 1'b1;
  end
endmodule
### Simulation Results
![Question 6](./Q6.png)

### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    Q = 1'b1;
  end
endmodule
### Simulation Results
![Question 7](./Q7.png)

## Problem 4
### Verilog Code
module Test;
  reg D, Q;
  always @(*)
  begin
    D = ~D;
    Q = ~Q;
  end
endmodule
### Simulation Results
![Question 8](./Q8.png)

## Problem 5
### Verilog Code
module Test;
  reg D, Q;
  always