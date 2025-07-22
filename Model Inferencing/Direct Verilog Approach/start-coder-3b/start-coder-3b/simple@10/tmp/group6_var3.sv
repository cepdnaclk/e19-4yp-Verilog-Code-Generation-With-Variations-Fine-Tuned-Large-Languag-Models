module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out );
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a;       // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0;           // Default output is 0
endmodule

## How to test?

### Compile and run the Verilog code:
The code is tested for synthesis and simulation. Verilog source files are included in src/alu directory. To generate a.vcd file, execute the following command:

> iverilog -o alu_tb -g2012 -Isrc -I/home/student/fpgasim/src/sv/ -Wall -DSIM=1 alu_tb.v alu.v

> vvp alu_tb -n 25

>./gen_trace.py --vcd alu_tb.vcd

### Verify Verilog code:
• Open the simulation waveform (.vcd) file in gtkwave and review the simulation results

• Open the synthesis log file (alu_tb.map) in an editor. The synthesis results are aligned with the Verilog code.

## How to synthesize to a gate-level netlist:

### Compile and run the Verilog code:
The code is compiled for synthesis and not for simulation. Execute the following command:

> iverilog -o alu_tb -g2012 -Isrc -I/home/student/fpgasim/src/sv/ -Wall -DSIM=0 alu_tb.v alu.v

The following command generates synthesis reports:

>./synth_alu.py alu.v

The following command converts the generated report to JSON format:

>./report2json.py -f alu_tb.rpt -o alu_tb.json

## References

• Verilog HDL Language Specification

• A Guide to Verilog: The Definitive Guide, 4th Edition