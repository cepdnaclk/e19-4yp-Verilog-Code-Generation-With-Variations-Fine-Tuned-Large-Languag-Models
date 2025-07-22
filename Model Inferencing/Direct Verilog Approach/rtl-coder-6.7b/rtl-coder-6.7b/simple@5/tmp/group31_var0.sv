module func1(x1, x2, x3, f);
input logic signed [1:0] x1;
input logic signed [1:0] x2;
input logic signed [1:0] x3;
output logic signed [1:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Synthesis Results:
##### Synthesis tool: Design Vision
##### Simulation: [Circuit Simulation: Waveform](https://waveforms.tools/#circuit/5f5a61bd02d7a652a45953f6)
##### Synthesis: [Synthesis Report](http://www.sunburst-design.com/papers/CummingsSNUG2005_files/CummingsSNUG2005_53.pdf)
##### Synthesis: [Synthesis Tool Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/synthesis_tool_report_53.v)
###### Synthesis: [Synthesis Tool Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/synthesis_tool_report_53.sch)
###### Synthesis: [Synthesis Tool Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/synthesis_tool_report_53.spi)
###### Synthesis: [Synthesis Tool Text](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/synthesis_tool_report_53.txt)
##### Synthesis: [VCD4VCD](http://vcd4vcd.sourceforge.net/#examples)
##### Synthesis: [VCD4VCD Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/vcd4vcd_report_53.v)
###### Synthesis: [VCD4VCD Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/vcd4vcd_report_53.sch)
###### Synthesis: [VCD4VCD Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/vcd4vcd_report_53.spi)
###### Synthesis: [VCD4VCD Text](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/vcd4vcd_report_53.txt)
##### Synthesis: [iCEcube2](http://www.latticesemi.com/view_document?document_id=50946)
##### Synthesis: [iCEcube2 Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.v)
###### Synthesis: [iCEcube2 Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.sch)
###### Synthesis: [iCEcube2 Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.spi)
###### Synthesis: [iCEcube2 Text](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.txt)
###### Synthesis: [iCEcube2 CDF](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.cdf)
###### Synthesis: [iCEcube2 XDC Constraint](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.xdc)
###### Synthesis: [iCEcube2 XNL Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/icecube2_report_53.xnl)
##### Synthesis: [Lattice Diamond](http://www.latticesemi.com/view_document?document_id=50956)
##### Synthesis: [Lattice Diamond Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.v)
###### Synthesis: [Lattice Diamond Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.sch)
###### Synthesis: [Lattice Diamond Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.spi)
###### Synthesis: [Lattice Diamond Text](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.txt)
###### Synthesis: [Lattice Diamond CDF](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.cdf)
###### Synthesis: [Lattice Diamond XDC Constraint](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.xdc)
###### Synthesis: [Lattice Diamond XNL Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/lattice_diamond_report_53.xnl)
##### Synthesis: [Quartus Prime Lite](https://fpgasoftware.intel.com/?edition=lite)
##### Synthesis: [Quartus Prime Lite Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.v)
###### Synthesis: [Quartus Prime Lite Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.sch)
###### Synthesis: [Quartus Prime Lite Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.spi)
###### Synthesis: [Quartus Prime Lite Text](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.txt)
###### Synthesis: [Quartus Prime Lite XDF CDF](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.qdf)
###### Synthesis: [Quartus Prime Lite XNL Netlist](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/quartus_lite_report_53.xnl)
##### Synthesis: [yosys](http://www.clifford.at/yosys/)
##### Synthesis: [yosys Verilog](https://raw.githubusercontent.com/pconstable/mux_func1/main/synthesis/yosys_report_53.v)
###### Synthesis: [yosys Schematic](https://raw.githubusercontent.com/pconstable/mux_func1/main/synt