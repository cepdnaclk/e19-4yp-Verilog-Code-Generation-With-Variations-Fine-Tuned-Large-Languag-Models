module shift_reg( input [3:0] d_in, input clk, sr, sl, ld, rst,
input [1:0] s_cnt, output reg [3:0] q);
array [0:1] s = {1,4};
reg [3:0] int_q;
always @( d_in, q, s_cnt, sr, sl, ld ) begin: combinational
if( ld )
int_q = d_in;
else if( sr )
int_q = q >> s_cnt;
else if( sl )
int_q = q << s[s_cnt];
else int_q = q;
end
always @( posedge clk ) begin: register
if (rst) q <= 0;
else q <= int_q;
end
endmodule

## 16  MIPS Processor

MIPS is a RISC machine code. RISC stands for Reduced Instruction Set Computer. It is very similar to the CISC (Complex Instruction Set Computer) machine code. This is a low-level programming language (or machine code) because it does not contain high-level programming instruction. RISC uses a stack-like data structure to store variables and a heap-like structure to store memory addresses. This is an advantage because it makes the MIPS processor faster. On the other hand, these advantages are not enough to make MIPS a good machine code, which is why it is not usually used in modern programs. This is because modern machine code is more complex, efficient, and fast.

### MIPS32 Registers

MIPS32 has 10 integer registers, including the zero register, and 32 floating registers. Each register has an 32-bit register. The first register is the zero register, which has value $0$. The other 9 registers have different meanings. In MIPS32, the register names are

•  $0$:  zero
•  $1$:  at (reserved for assembler)
•  $2$:  v0, return value (used by load, alu, and store instructions)
•  $3$:  v1, return value (used by load, alu, and store instructions)
•  $4$:  a0, first load and store address (used by load and store instructions)
•  $5$:  a1, second load and store address (used by load and store instructions)
•  $6$:  t0, temporary value (used by alu instructions)
•  $7$:  t1, temporary value (used by alu instructions)
•  $8$:  t2, temporary value (used by alu instructions)
•  $9$:  t3, temporary value (used by alu instructions)
•  $10$:  t4
•  $11$:  t5
•  $12$:  t6
•  $13$:  t7, temporary value
•  $14$:  s0 (reserved for special functions)
•  $15$:  s1 (frame pointer)
•  $16$:  s2, temporary value
•  $17$:  s3 (reserved for system use)
•  $18$:  s4
•  $19$:  s5
•  $20$:  s6
•  $21$:  s7, temporary value
•  $22$:  t8
•  $23$:  t9, temporary value
•  $24$:  k0, used by load/store functions (and some special functions)
•  $25$:  k1
•  $26$:  gp (global pointer)
•  $27$:  sp (stack pointer)
•  $28$:  fp (frame pointer)
•  $29$:  ra (return address)

Floating-point registers are named as f0, f1, f2, and so on. The other 32 registers are floating registers as well; you can name them as f24 to f55.

### MIPS Instructions

MIPS has a total of 62 instructions. The instructions are categorized into the following groups:

• ALU instructions: add, addu, sub, subu, and, nor, or, sll, srl, sra, slt, sltu, sllv, srlv, sraw, and sllv.
• Load and store instructions: lb, lh, lw, lbu, lhu, lui, sb, sh, sw.
• Branch instruction: beq, bne, bgez, bltz, and bgezal.
• Jump instruction: jr, jal, jalr, j, jal.
• Reserved instruction: syscall, break, nop.
• Multiplying and dividing instructions: mult, multu, mfhi, mflo, div, divu, mod, modu.

#### ALU Instructions

##### ALU Instruction Examples
• Add $a = c + d$:
.
.
.
add $a, c, d$

• Add $a = b$:
.
.
.
add $a, b, b$

• Substract $a = d - c$:
.
.
.
sub $a, d, c$

• $a = b + c$:
.
.
.
add $a, b, c$

• $a = b - c$:
.
.
.
sub $a, b, c$

• $a = b$ AND $c$:
.
.
.
and $a, b, c$

• $a = b$ OR $c$:
.
.
.
or $a, b, c$

• Shift left $a = b \circ 2^1$:
.
.
.
sll $a, b, 1$

• Shift left $a = b \circ 2^c$:
.
.
.
sll $a, b, c$

• Shift right logical $a = b \circ 2^1$:
.
.
.
srl $a, b, 1$

• Shift right logical $a = b \circ 2^c$:
.
.
.
srl $a, b, c$

• Shift right arithmetical $a = b \circ 2^1$:
.
.
.
sra $a, b, 1$

• Shift right arithmetical $a = b \circ 2^c$:
.
.
.
sra $a, b, c$

• $a = b$ Less than $c$:
.
.
.
slt $a, b, c$

• $a = b$ Less than (or equal to) $c$:
.
.
.
sltu $a, b, c$

• $a = b$ Shift left $2^1$:
.
.
.
sllv $a, b, c$

• $a = b$ Shift left $2^c$:
.
.
.
sllv $a, b, c$

• $a = b$ Shift right logical $2^1$:
.
.
.
srlv $a, b, c$

• $a = b$ Shift right logical $2^c$:
.
.
.
srlv $a, b, c$

• $a = b$ Shift right arithmetical $2^1$:
.
.
.
srav $a, b, c$

• $a = b$ Shift right arithmetical $2^c$:
.
.
.
srav $a, b, c$

#### Load and Store Instructions

##### Load and Store Instruction Examples
• Load $v1$ from global pointer address:
.
.
.
lw $v1, 0($gp)

• Store $v0$ globally at global pointer address:
.
.
.
sw $v0, 0($gp)

• Load $v1$ from $sp + 8$:
.
.
.
lw $v1, 8($sp)

• Load $v1$ from $sp + 8$:
.
.
.
ld $v1, 8($sp)

• Store $v1$ globally at global pointer address:
.
.
.
sw $v1, 0($gp)

• Load $c$ from $a$:
.
.
.
lb $c, 4($a)

• Load $b$ from $a$:
.
.
.
lb $b