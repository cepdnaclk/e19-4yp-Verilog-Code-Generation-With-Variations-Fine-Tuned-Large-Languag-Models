module gates4_top
(
input wire [6:0] in,
input wire [2:0] sele_mda,
output wire ld,
output wire [2:0] out
);
wire [2:0] mda;
assign mda[1] = sele_mda[0];
assign mda[0] = sele_mda[1];
case (mda[1:0])
3'b00: assign ld = gate_mem [in];
#1
3'b01: assign out[0] = 0; assign out[1] = 0; assign out[2] = 0; #1
3'b10: assign out[0] = 1; assign out[1] = 1; assign out[2] = 1; #1
3'b11: assign out[0] = 0; assign out[1] = 0; assign out[2] = 1; #1
default: assign out[0] = 0; assign out[1] = 0; assign out[2] = 0; #1
endcase
endmodule
Simulation:
In the simulation of the module 'gates4_top', the outputs 'out' are observed at time = 0.1 ns.

## 9.   Summary

In the previous tutorial, a Verilog module was presented; the module was simulated; and the verilog code was modified to add an assignment statement. The modifications were used to produce a set of variants (different assignments) that can be used to generate a set of simulation results. Each variant of the module produced a different set of simulation results. The variations were used in different parts of the design.

This tutorial covered the following topics:

• How to simulate a Verilog module.
• How to modify a Verilog code to generate multiple variants of the same module.
• What are the limitations on the size of a Verilog module.
• The types of inputs that can be used for a Verilog module.
• How to design a Verilog module with memory access.

### Exercises

• This tutorial was an introduction to designing and simulating different variations of a Verilog module. You can use this tutorial to design additional modules and variations.
• Use the following Verilog code in your designs to produce multiple variations.
module gates4_top
(
input wire [3:0] in,
output wire ld
);
assign ld = in[0] ^ in[1] ^ in[2] ^ in[3];
endmodule