```verilog
module testbench;
reg d,en;
wire q,qb;
//dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
initial
begin
d = 1'b0;
en = 1'b0; // Latch disabled
end
always #4 en =~en; // Enable toggles every 4 time units
always #8 d=~d; // Data toggles every 8 time bits
always @ (state) $display("inside state %b", state); // Add this line
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```
### Simulation Output:
```
vsim -novopt -c -do "do {simulate.do}" -l simulate.log tstdlatch
//
// Note: There is no support for multi-bit vectors in command line macro expansion.
//
//
// Initializing simulation...
//
//Loading package work
//Loading library C:/Users/Administrator/Desktop/work/06_vsim/tstdlatch-vlog.vlib
//Loading library c:/Xilinx/_mywork/13_vivado/test_dlatch/test_dlatch.cache/work
//Loading library c:/Xilinx/_mywork/13_vivado/test_dlatch/test_dlatch.runs/impl_1
//Loading library C:/Users/Administrator/Desktop/work/06_vsim/test_dlatch_pkg_vlog.vlib
//Loading library C:/Users/Administrator/Desktop/work/06_vsim/tstdlatch_vlog.vlib
//Loading library c:/Users/Administrator/Desktop/work/05_xilinx/test_dlatch_vlog.vlib
//Loading library C:/Xilinx/Vivado/2018.2/data/verilog/src/unisims_ver
//Loading library C:/Xilinx/Vivado/2018.2/data/verilog/src/unimacro_ver
//Loading library C:/Xilinx/Vivado/2018.2/data/verilog/src/unisource_ver
//Loading library C:/Xilinx/Vivado/2018.2/data/verilog/src/UCF_files
//Loading library C:/Xilinx/Vivado/2018.2/data/verilog/src/glbl
//Doing reset
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//