module ALU ( input [7:0] a, b, input pass, add,
output logic [7:0] alu_out ); // Changed the output type
// Simple combinational ALU
always @(a or b or pass or add)
if (pass) alu_out = a; // Pass input 'a'
else if (add) alu_out = a + b; // Add inputs 'a' and 'b'
else alu_out = 0; // Default output is 0
endmodule
### Altering the verilog code
It is not necessary to alter the code to make the module work correctly.
Now we have created the ALU module. Let us connect it to the CPU module via the connections.
19
The CPU Control Module
Module Name Signal Type Module Input Output a, b, pass, add Control A
a_reg[7:0], b_reg[7:0],
pass, add,
cpu.alu.a_reg[7:0], cpu.alu.b_reg[7:0], cpu.alu.pass, cpu.alu.add ALU,
alu_out cpu.alu.alu_out[7:0],
cpu_alu_out[7:0]
### Altering the Verilog Code:
module CPU ( input [15:0] a, b, input pass, add,
output logic [15:0] cpu_alu_out );
// Control input to the ALU
input [7:0] a_reg, b_reg;
input [7:0] pass, add;
// The ALU
ALU cpu_alu (.a_reg(a_reg),.b_reg(b_reg),.pass(pass),.add(add));
always @*
cpu_alu_out = cpu_alu.alu_out; // Forward the ALU output
endmodule
We use a control register to create the ALU module.
We do not need to modify the CPU module.
The control registers are always active low.
They do not need to be updated at any time.
### Altering the code:
// Control input to the ALU
input [7:0] a_reg, b_reg;
input [7:0] pass, add;
// The ALU
ALU cpu_alu (.a_reg(a_reg),.b_reg(b_reg),.pass(~pass), // Changed the output from active low to active high.
.add(~add));
always @*
cpu_alu_out = cpu_alu.alu_out; // Forward the ALU output
endmodule
100
The CPU Control Module
8.4.3.4 The Branch Module:
Branch Module:
Input
Control a, b, add, pass
Output
cpu_br_out
### Base Verilog Code:
module Branch ( input [7:0] a, b, input pass, add,
output reg cpu_br_out );
// Branching module
// Always keep track of the PC
integer pc;
assign pc = a;
// If branches are enabled,
// execute branching logic
if (pass)
always @(a or b)
if (add)
pc = pc + 4;
cpu_br_out = 1; // Indicate a branch
else cpu_br_out = 0; // Indicate no branch
endmodule
### Altered Verilog Code:
module Branch ( input [7:0] a, b, input pass, add,
output logic cpu_br_out );
// Branching module
// Always keep track of the PC
integer pc;
assign pc = a;
// If branches are enabled,
// execute branching logic
if (pass)
always @(a or b) // Changed the pass signal logic
if (add)
pc = pc + 4;
cpu_br_out = 1; // Indicate a branch
else cpu_br_out = 0; // Indicate no branch
endmodule
### Altered CPU Module Code:
module CPU ( input [15:0] a, b, input pass, add,
output logic [15:0] cpu_alu_out,
output logic cpu_br_out );
// Control input to the ALU
input [7:0] a_reg, b_reg;
input [7:0] pass, add;
// The ALU
ALU cpu_alu (.a_reg(a_reg),.b_reg(b_reg),
.pass(~pass), // Changed the output from active low to active high.
.add(~add));
Branch cpu_branch ( // The branch module
.a(a_reg),.b(b_reg),
.pass(~pass),.add(~add));
assign cpu_alu_out = cpu_alu.alu_out; // Forward the ALU output
assign cpu_br_out = cpu_branch.cpu_br_out; // Forward the branch output
endmodule
Next we will look at the complete CPU module. You can use this module for all future CPU designs in this book.
101
The CPU Control Module
9. Summary:
In this chapter we have designed the CPU control module.
The CPU module was modified to include 2 control signals (pass, add) instead of one (add). The output of the CPU is now the ALU output and the branch output.
102
Chapter 10: The CPU Bus Interface
The CPU bus provides the system with access to the peripherals it needs.
The peripheral buses provide the CPU with information on how to access the peripherals.
The CPU bus must have different buses for each peripheral because the peripherals may be different.
103
The CPU Bus Interface
10.1.1.1 The Verilog Code:
module bus_interface (
input [31:0] addr,
input [31:0] data_in,
output [31:0] data_out,
input r_w,
input clk,
input we,
output done,
output [31:0] rdata,
output we_n,
output clk_n,
output strobe,
output [4:0] addr_bus,
output [2:0] rw_bus );
// I/O interface to CPU
// Input
input [31:0] addr,
input [31:0] data_in,
input [31:0] data_out,
input clk;
// Control bits
input [3:0] addr_cmd,
input [2:0] r_w,
// Output
output [31:0] data_out,
output [31:0] rdata,
// Control outputs
output done,
output we,
output [7:0] we_n,
output [7:0] clk_n,
output strobe,
output [4:0] addr_bus,
output [2:0] rw_bus );
// CPU address bus
output [31:0] addr_out;
// I/O address
output [31:0] data_out;
// CPU data bus
output [4:0] addr_bus;
// CPU address bus
output [2:0] rw_bus; // Read/Write bit
// I/O port
output we;
output we_n;
output clk;
output clk_n;
output strobe;
// Data read
assign rdata = data_in;
// Data write
assign data_out = data_in;
// Control signals
assign done = 1'b0;
assign clk = 0;
assign clk_n = 0;
assign strobe = 0;
// Address bus
assign addr_bus = addr;
assign addr_out = addr;
assign rw_bus = r_w; // Read/Write bit
always @(posedge clk)
begin
we <= r_w;
clk <= clk_n;
clk_n <= clk;
endmodule
104
The CPU Bus Interface
10.1.2.2 The Altera Image:
The CPU bus is not part of the Altera image.
It is not necessary to create a bus interface for the Altera image. The Altera image already has the correct I/O ports to provide access to the peripherals.
105
The CPU Bus Interface
10.1.2.3 The Intel Image:
The Intel image has separate I/O ports for each peripheral.
In this case, the CPU bus interface is also necessary, as it provides access to the peripherals.
106
Chapter 10: The CPU Bus Interface
10.2.1.1 The Verilog Code:
module bus_interface (
input [31:0] addr,
input [31:0] data_in,
output [31:0] data_out,
input r_w,
input clk,
input we,
output [31:0] rdata,