module par(in, parity, all_ones);
input [7:0] in;
output parity, all_ones;
wire [7:0] inputs;
wire [2:0] parity;
wire [1:0] all_ones;
assign parity = inputs[3] ^ inputs[2] ^ inputs[1] ^ inputs[0];
assign all_ones = inputs[4] & inputs[3] & inputs[2] & inputs[1];

endmodule

#include <stdio.h>
#include <stdint.h>

union u32 {
uint32_t u;
struct {
uint8_t x1 : 1;
uint8_t x2 : 1;
uint8_t x3 : 1;
uint8_t x4 : 1;
};
};

int main()
{
union u32 input = {0};
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x9e;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x6e;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x3e;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x1e;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0xe;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x0;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
input.u = 0x77;
printf("%d \t %d", input.x1, input.x2);
printf("\n");
return 0;
}

### Output:
0 	0
1 	1
1 	1
1 	1
1 	1
1 	1
0 	0
1 	0

## Interesting facts:

• All logic operations can be performed using a single bitwise operation.
• The number of bits needed is determined by the operation, and there appears to be no upper limit.
• If you have an even number of inputs, parity is just the exclusive OR of the inputs. (N & P)
• If you have an odd number of inputs, every other bit is a parity bit, and the parity is the exclusive OR of those bits.
• The maximum number of inputs can be calculated using the formula: (N-1) & (N-2)

## Pipelined MUXes:

The idea behind pipelining is to take the current stage input(s) of a circuit, and give output at the next stage. The timing of the current stage will not determine the timing of the next stage.

The next stage will be executed when the data of the current stage is ready to be used.

A typical example of a pipelined MUX would be a pipelined CPU.

## Pipelined CPU:

Pipelined CPU consists of the following stages:

1. Instruction fetch
2. Instruction decode
3. ALU execution
4. Memory access
5. Write back

The first stage can be done in parallel, while the fourth and fifth stage will depend on the outputs of the earlier stages.

The instruction fetch and write back will be independent, since they are not dependant on each other.

## Pipelined CPU Example:

We will be using the following Verilog code for a pipelined CPU, the program counter (PC) is incremented for each instruction.

module CPU(clk, reset, pc_i, ir_i, m_i, r15_i, r16_i, r17_i, r18_i, op_i, out_i, out_2_i);
input clk, reset;
input [15:0] pc_i, ir_i, r15_i, r16_i, r17_i, r18_i;
output [15:0] op_i, out_i, out_2_i;

wire [15:0] pc;
wire [15:0] ir;
wire [15:0] r15;
wire [15:0] r16;
wire [15:0] r17;
wire [15:0] r18;

assign op_i = {ir[3:0], ir[5], ir[6:4], ir[7:0]};

always @ (posedge clk or posedge reset or posedge reset)
begin
if(reset)
begin
pc <= 0;
op_i <= 0;
out_i <= 0;
out_2_i <= 0;
end
else
begin
pc <= pc_i;
ir <= ir_i;
r15 <= r15_i;
r16 <= r16_i;
r17 <= r17_i;
r18 <= r18_i;
end
end

always @ (posedge clk)
begin
out_i <= 16'd0;
out_2_i <= 16'd0;
if(ir[2] == 1)
out_i = r15;
else if(ir[2] == 2)
out_i = r16;
else if(ir[2] == 3)
out_i = r17;
else if(ir[2] == 4)
out_i = r18;
else if(ir[2] == 5)
out_i = pc + 16'd0;
else if(ir[2] == 6)
out_i = pc + 8'd1;
else
out_i = out_2_i;

if(ir[1] == 1)
out_2_i = out_i;
else if(ir[1] == 2)
out_2_i = 16'd0;
else if(ir[1] == 3)
out_2_i = 16'hffff;
else if(ir[1] == 4)
out_2_i = pc + 16'd0;
else if(ir[1] == 5)
out_2_i = pc + 8'd1;
else if(ir[1] == 6)
out_2_i = pc + 8'd2;
else if(ir[1] == 7)
out_2_i = pc + 8'd4;
else if(ir[1] == 8)
out_2_i = pc + 8'd8;
else if(ir[1] == 9)
out_2_i = pc + 8'd16;
else
out_2_i = ir[0];

end

endmodule

## Output:

### Assembly Code:

.data
.align 2
.set _sp, 1
.global _start
.global _fin
.global _in
_in:
.word 16'h0123
.word 16'h0456
.word 16'h0789
_fin:
.word 0
.text
.align 2
.global _start
_start:
lui X0, %hi(_in)
addi X0, X0, %lo(_in)
lw X3, 0(X0)

addi X1, X0, 16
beq X3, X1, _fin

lw X3, 12(X0)
srai X3, X3, 4
addi X3, X3, 8
beq X3, X1, _fin

addi X1, X0, 8
beq X3, X1, _fin

lw X3, 24(X0)
srai X3, X3, 4
addi X3, X3, 8
beq X3, X1, _fin

addi X1, X0, 4
beq X3, X1, _fin

addi X1, X0, 0
beq X3, X1, _fin

addi X1, X0, 8
beq X3, X1, _fin

addi X1, X0, 16
beq X3, X1, _fin

addi X0, X0, 16
j