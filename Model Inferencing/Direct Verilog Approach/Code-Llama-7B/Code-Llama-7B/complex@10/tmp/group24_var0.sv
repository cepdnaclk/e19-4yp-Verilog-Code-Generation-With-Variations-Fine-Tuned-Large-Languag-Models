*Testbench*
```
// Testbench for Microprocessor
module tst_mup_1;
reg clk, en, int;
// Instantiate DUT
mup_opr rr(clk, int, en);
initial begin
int = 1'b0;
clk = 1'b0;
en = 1'b1;
end
always #2 clk = ~clk;
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk, $time, en, int, rr.pc, rr.ir, rr.dcop);
initial #340 $stop;
endmodule
```
*Microprocessor*
```
// Microprocessor Module
module mup_opr(input clk, input int_in, input en, output reg [3:0] dcop);
// PC and instruction register
reg [7:0] pc,ir;
// Registers and memory
reg [7:0] r0,r1,r2,r3,r4,r5;
reg [7:0] mem [0:255];
// Counter for BCD output
integer BCD_in;
...
// State machine
typedef enum {INIT,DEC,BCD,INC,DONE} state_t;
state_t state;
// Main state machine
always @(negedge clk)
if (en == 1'b1)
begin
dcop = 4'b0; // reset DC OP flag
case (state)
INIT:
begin
pc = 2; // initialize address pointer
r0 = 16; // initialize input
r1 = 1; // initialize counter
r5 = 240; // initialize output address
state = DEC;
end
DEC: // convert input to integer
begin
r2 = r0[7:4];
r3 = r0[3:0];
state = BCD;
end
BCD