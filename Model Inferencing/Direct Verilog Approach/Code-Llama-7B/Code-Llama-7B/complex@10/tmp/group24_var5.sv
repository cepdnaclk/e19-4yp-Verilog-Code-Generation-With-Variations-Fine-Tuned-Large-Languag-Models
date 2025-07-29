module tst_mup; // Testbench for Microprocessor
reg clk,en,int; // Clock, Enable, Interrupt inputs
// Instantiate DUT if not already instantiated
// mup_opr rr(clk,int,en); // Instantiation needed
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d", clk,$time,en,int,rr.pc,rr.ir,rr.dcop); // Corrected format specifiers
// Instantiate DUT if not already instantiated
// mup_opr rr(clk,int,en); // Instantiation needed
initial #40 $stop; // Stop simulation
endmodule
## Testing
- Testing should be done with a waveform viewer, such as GTKWave, to verify correct behavior and to find any errors in the design.
- A Tcl script can be used to automatically open GTKWave when running a simulation.
- The following test should be verified in a waveform viewer:
- Enable is asserted at t=0 (for 2 clock cycles)
- Enable is deasserted for 4 clock cycles
- Enable is asserted at t=18 (for 2 clock cycles)
- Enable is deasserted for 3 clock cycles
- Enable is asserted at t=26 (for 2 clock cycles)
- Enable is deasserted for 2 cycles
- Enable is asserted at t=32 (for 2 clock cycles)
- Enable is deasserted for 4 clock cycles
- Enable is asserted at t=46 (for 2 clock cycles)
- Enable is deasserted for 3 clock cycles
- Enable is asserted at t=58 (for 2 clock cycles)
- Enable is de