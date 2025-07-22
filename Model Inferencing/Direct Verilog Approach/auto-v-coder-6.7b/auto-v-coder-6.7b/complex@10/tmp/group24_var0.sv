In your main code, make sure you have `pkg` module and `consts` inside it. The `pkg` module can be defined as follows:

```verilog
`ifndef pkg_vh
`define pkg_vh

package pkg;
parameter [3:0] consts [0:15] = '{
    4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1000,
    4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111, 4'b0000,  // BCD constants
};
endpackage

`endif
```

Then, in your testbench, reference the `pkg` module and use it as follows:

```verilog
module tst_mup; // Testbench for Microprocessor
import pkg::*; // Import pkg module
reg clk,en,int, BCD_in; // Clock, Enable, Interrupt, and input BCD
// Assuming mup_opr is the microprocessor module instance
// mup_opr rr(clk,int,en, BCD_in); // Corrected with BCD_in input
initial begin
BCD_in=4'b0001; clk=1'b0;en=1'b0;int=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, BCD_in=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d",