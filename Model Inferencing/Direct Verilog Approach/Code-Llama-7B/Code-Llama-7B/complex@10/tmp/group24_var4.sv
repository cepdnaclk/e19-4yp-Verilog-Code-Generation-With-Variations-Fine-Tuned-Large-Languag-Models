// Package definition
parameter N=8; // Size of bus
package pkg; // Package definition
// Constants
parameter BCD_in=7; // BCD input
const int unsigned consts[]='{1,2,3,4,5,6,7,8,9}; // Array of constants
endpackage
module mup_opr (input clk,int,en, output [N-1:0] dcop); // Microprocessor module
reg [N-1:0] pc, dcop, ir, op; // Program counter, data coprocessor, instruction register, operand
// DUT
always_ff @(posedge clk or posedge int)
if (int) pc<=0; // Reset program counter on interrupt
else if (en) // If enabled
begin
if (ir[N-1:N-2]==2'b10) // If instruction is a jump
pc<=ir[N-3:0]; // Jump to new address
else if (ir[N-1:N-2]==2'b11) // If instruction is an add
dcop<=dcop+op; // Add operand to data coprocessor
end // Else if
end // always_ff
// BCD_in using inside operator with array select using XMR
always_comb
begin // Check if BCD_in is in consts array
if (pkg::BCD_in inside {pkg::consts}) // If BCD_in is in consts array
dcop<=ir[N-1:N-2]; // Set data coprocessor to BCD_in
else // Else
dcop<=dcop; // Do nothing
end // always_comb
endmodule
### Expected Results:
The testbench for the modified microprocessor should pass without any errors or warnings. The testbench should run for 40 cycles and stop.
### Testing Strategy:
Test the microprocessor using the modified testbench to ensure that the modification is correct and that the BCD_in value is correctly converted to the data coprocessor.
### Code Walkthrough:
1. Package definition: The package definition sets the size of the bus `N` to 8 and defines a constant `BCD