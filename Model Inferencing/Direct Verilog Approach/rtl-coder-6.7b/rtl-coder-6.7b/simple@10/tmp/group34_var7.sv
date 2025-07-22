// Create a module with one input and one output that behaves like a wire
module wire_assign( input [5:0] in[*], output reg out);
    // assign out to in
    always @(in) out = in.inside[3:2];
endmodule
### Test Command:
verilog -y $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_fabric.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_fabric_testbench.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_global.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_globals.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_memory.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_primitives.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_routing.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_sparce.v $(VPR_ROOT)/vpr/simulations/verilog/verilog_code/testbench/tb_wire_assign.v