```
// Source: tst_mup.v
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

## How to generate VHDL code?

### Code to generate VHDL code:
```
vvp tst_mup.vvp -fst=fst_mup.fst -o tst_mup.vhd
```
### Running VHDL code:
```
ghdl -a tst_mup.vhd
ghdl -e tst_mup
ghdl -r tst_mup --vcd=tst_mup.vcd
```

## References:
- [1] [Verilator Tutorial](https://verilator.org/tutorial)
- [2] [Verilator User Guide](https://verilator.org/guide)
- [3] [Xilinx Vivado HLS Tutorial](https://www.xilinx.com/html_docs/xilinx2017_4/Vivado_HLS/index.html?verilog_testbench.html)
- [4] [VHDL User's Guide](http://www.vhdl.org/docs/yak)
- [5] [VHDL LRM](https://www.cs.columbia.edu/~sedwards/books/hst/online/VHDLRef_latest/html/vhdl.pdf)
- [6] [Verilog Reference Manual (latest)](http://www.asic-world.com/verilog/v_ref_manual.pdf)
- [7] [Verilog Code Examples](http://www.asic-world.com/verilog/examples.html)
- [8] [RTL Simulation Tools for Verilog and VHDL](https://www.electronicshub.org/vhdl-verilog-simulation-tools/)

#
# Makefile for verilator tests
#

# Verilator executable
VERILATOR=verilator

# Command line options
VERILATOR_OPTS=-Wall --trace --top-module top --cc top.sv --exe top_tb.cpp

# Verilator flags
VFLAGS=-O3

# Extra include directories
#VFLAGS+=-I$G/verilator-3.855/include

# Executable name(s)
EXEC=top_tb

# Build executables
$(EXEC):
	$(VERILATOR) $(VERILATOR_OPTS) $(VFLAGS) -o $@.exe
	make -C obj_dir -f Vtop.mk

# run simulation
run: $(EXEC)
	obj_dir/Vtop

# Clean up
clean:
	rm -rf $(EXEC) *.vcd obj_dir
#include "top.h"

int main(int argc, char* argv[]){
    // Top Testbench
    top testbench; // Object of testbench

    printf("Running simulation...\n");
    testbench.run(); // Run simulation

    printf("Done!\n");

    return 0;
}