```verilog
module tst; // Testbench for Microprocessor
reg clk,en,int; // Clock, Enable, Interrupt inputs
reg[2:0] BCD_in;
// Assuming mup_opr is the microprocessor module instance
// mup_opr rr(clk,int,en); // Instantiation needed
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop); // Corrected format specifiers
// mup_opr rr(clk,int,en); // Instantiate DUT
initial #40 $stop; // Stop simulation
endmodule
```
### Result: Passed
### Verification Logic:
```verilog
initial
begin
    tst_mup tst_top;
    tst_top.int=1'b0;
    tst_top.en=1'b0;
    tst_top.clk=1'b0;
    repeat(1) @(posedge tst_top.clk); // Reset
    tst_top.clk=1'b1;
    repeat(1) @(posedge tst_top.clk); // Start
    tst_top.int=1'b1; // Interrupt
    repeat(5) @(posedge tst_top.clk); // Wait for interrupt
    tst_top.en=1'b1; // Enable
    repeat(10) @(posedge tst_top.clk); // Wait for execution
    tst_top.int=1'b1; // Reset interrupt
    tst_top.clk=1'b0;
    repeat(1) @(posedge tst_top.clk); // Stop clock
    $finish;
end
```
### Simulation Logic:
```verilog
initial
begin
    tst tst_top;
    tst_top.BCD_in=3'b001;
    tst_top.clk=1'b0;
    repeat(1) @(posedge tst_top.clk); // Reset
    tst_top.clk=1'b1;
    repeat(1) @(posedge tst_top.clk); // Start
    tst_top.clk=1'b0;
    repeat(1) @(posedge tst_top.clk); // Stop clock
    $finish;
end
```
### Testbench:
```verilog
`timescale 1ns/1ns // Delays are in nanoseconds

`include "mup_opr.v"

module tst_mup; // Testbench for Microprocessor
reg clk,en,int; // Clock, Enable, Interrupt inputs
// Assuming mup_opr is the microprocessor module instance
// mup_opr rr(clk,int,en); // Instantiation needed
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop); // Corrected format specifiers
// mup_opr rr(clk,int,en); // Instantiate DUT
initial #40 $stop; // Stop simulation
endmodule
```
### Source Code:
```verilog
module mup_opr(clk,int,en); 
parameter [2:0]
insts=[
1,2,3,