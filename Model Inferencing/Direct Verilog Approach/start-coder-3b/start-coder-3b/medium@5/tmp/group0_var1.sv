```verilog
module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specparam dl1, dl2; // Define specify parameters for s and ca delays
  xor (s,a,b);
  and (ca,a,b);
  (a, b *> s) = dl1;
  (a, b *> ca) = dl2;
  specify
    if (a[1:0] == 1'b1, b[1:0] == 1'b1) begin // Check that the two inputs are both 1
      dl1 = 1; // Define specify parameter for s delay
      dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    end
    else begin // Otherwise
      dl1 = 2; // Define specify parameter for s delay
      dl2 = dl1 + 2; // Define specify parameter for ca delay based on dl1
    end
  endspecify
endmodule
```
/projects/project1/README.md
# MIPS CPU Design and Simulation

### Design and Simulation of a MIPS-based CPU using SystemVerilog.
## Introduction
The MIPS architecture is an industry-standard instruction set architecture first
introduced in 1985. The MIPS CPU is a simple, fast, efficient instruction set with
support for many of the mainstream application domains. This project is aimed at
creating a MIPS CPU using SystemVerilog and Xilinx ISE. The CPU is capable of
executing floating point and integer arithmetic. The CPU supports pipelining of
the different stages. As part of the project, the implementation is tested and
simulated at two different levels:
- Firstly, the design is simulated using VSIM.
- Secondly, the design is synthesized to an FPGA and the resulting implementation is simulated using VSIM and Vivado.

## Project Details

The CPU is designed and built on Xilinx Artix-7 Series FPGA. The design uses the System Verilog language to model the circuit as well as the programming of the CPU with the MIPS assembler language. The MIPS assembler is used to generate the machine code that is loaded into the CPU.

## Detailed Description

#### MIPS Instruction Format
The MIPS architecture uses 32 bits to store instructions. The first 6 bits of the instruction corresponds to the opcode, the next 6 bits to the function code, and the other 26 bits to the 26 operand bits. Each bit of the instruction is represented as one bit in the binary data.

The opcode determines the type of operation to be performed by the CPU. The available MIPS instructions are:
1. Arithmetic Instructions
	- Add
	- Addu
	- Addi
	- Addiu
	- Sub
	- Subu
	- Subi
	- Subiu
2. Logical Instructions
	- And
	- Or
	- Xor
	- Sll
	- Sllv
	- Srl
	- Srlv
	- Sra
	- Srav
	- Slt
	- Sltu
3. Branch Instructions
	- Beq
	- Bne
4. Jump Instructions
	- J
	- Jal
5. Load Instructions
	- Lb
	- Lh
	- Lw
6. Store Instructions
	- Sh
	- Sw
	- Swl
	- Swr
7. Syscall Instructions
	- Syscall
	- Eret
8. Shift Instructions
	- Sll
	- Srl
	- Sra
	- Sll

#### MIPS Datatypes
The project uses the MIPS Instruction Format to execute a set of instructions. The MIPS Instruction Format uses 32 bits to store instructions. The first 6 bits correspond to the opcode, the next 6 bits correspond to the function code, and the remaining 26 bits correspond to the operand bits. The opcodes are further divided into instructions based on the type of operand they use. For example, the arithmetic instructions use register values as operands and the branch instructions use register and constant values as operands.

Register numbers are stored as 32 bit unsigned integers. There are 32 registers in the CPU, numbered from $0 to $31. In the project, these registers are implemented using a std_logic array. Each element of the array contains a 32 bit unsigned integer. The contents of the array are stored as binary data with 32 bits. The MIPS instruction format includes the use of shamt in the instructions that involve shift operations. In the project, this is modelled using a std_logic_vector.

The instruction data is stored in a data variable of type unsigned(31 downto 0) in the CPU. The register data is represented using a std_logic array of registers that is 32 elements long. Each element contains a 32 bit unsigned integer. It is used to store the register values.

The CPU implements a set of 5 stages with the help of the control signals:
1. Instruction Fetch Stage
	- The fetch_stage module is used to decode the instruction data in the instruction register and generate the next instruction data in the instruction register.
2. Instruction Decode Stage
	- The decode_stage module is used to extract the operation code from the instruction data and pass it on to the appropriate decoding module.
	- Based on the opcode extracted, the decode_stage module passes the operation code and the register numbers to the appropriate decoding module.
3. Execute Stage
	- The execute_stage module is used to extract the source and destination registers from the instruction data and pass it on to the appropriate execution module.
	- Based on the operation code extracted, the execute_stage module passes the source and destination registers to the appropriate execution module.
4. Memory Stage
	- The memory_stage module is used to extract the address from the instruction data and pass it on to the appropriate memory module.
	- Based on the operation code extracted, the memory_stage module passes the address to the appropriate memory module.
5. Write Back Stage
	- The write_back_stage module is used to extract the result from the instruction data and pass it on to the appropriate write back module.
	- Based on the operation code extracted, the write_back_stage module passes the result to the appropriate write back module.

#### Floating Point Operations
The CPU supports the following floating point operations:
- Add: Adds two floating point values.
- Subtract: Subtracts one floating point value from another.
- Multiply: Multiplies two floating point values.
- Divide: Divides one floating point value by another.
- Float To Int: Converts a floating point value to its integer equivalent.
- Float To Float: Converts a floating point value to another floating point value.
- Float To Unsigned: Converts a floating point value to an unsigned integer.
- Float To Signed: Converts a floating point value to a signed integer.
- Int To Float: Converts an integer value to a floating point value.
- Unsigned To Float: Converts an unsigned integer to a floating point value.
- Signed To Float: Converts a signed integer to a floating point value.

The CPU implements the floating point operations using a pipeline of modules. The pipeline begins with the FPU_add module, which performs the addition operation. The result of the addition operation is passed on to the FPU_sub module, which subtracts one floating point value from another. This operation is then passed on to the FPU_mul module, which multiplies two floating point values. The result of the multiplication operation is passed on to the FPU_div module, which divides one floating point value by another. The result of the division operation is passed on to the FPU_to_int module, which converts a floating point value to its integer equivalent. The result of the conversion operation is passed on to the FPU_to_float module, which converts a floating point value to another floating point value. The result of the conversion operation is passed on to the FPU_to_unsigned module, which converts a floating point value to an unsigned integer. The result of the conversion operation is passed on to the FPU_to_signed module, which converts a floating point value to a signed integer.

In the FPU_to_float module, the sign of the destination value is taken from the source value. The exponent and mantissa of the destination value is taken from the source value. The floating point result is then written to the destination register.

The FPU_to_unsigned module, the FPU_to_signed module, and the FPU_to_int module do not perform any operation, but instead load the result from the source register into the destination register.

The FPU_add module adds the source values and stores the result in the destination register. The FPU_sub module subtracts the source values and stores the result in the destination register. The FPU_mul module multiplies the source values and stores the result in the destination register. The FPU_div module divides the source values and stores the result in the destination register.

#### Shift Operations
Shifts can be performed by bitwise left or right shifts. The CPU supports the following shift operations:
- Sll: Performs a bitwise left shift of an integer value.
- Srl: Performs a