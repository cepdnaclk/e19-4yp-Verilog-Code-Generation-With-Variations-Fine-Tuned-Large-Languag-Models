module dff_p(output do, input di, wire clk);
  reg do;
  assign do = do;
  always @(posedge clk) begin
    if(di == 0) begin
      do <= {do[1],do[0]};
    end else begin
      do <= { do[0], ~do[0] };
    end
  end
endmodule
### Results:
When compiling with the modified code, the following error is shown:
```
Error--ParserError:./dff_p.v(9): Identifier "clk" not declared.
```
This indicates that the Verilog parser does not recognize wire as a type. In order to correctly compile the Verilog code with the SystemVerilog modifications, the type of the variable clk must be modified to be wire.

### Verilog Code:
```
module dff_p(output do, input di, input clk);
  reg do;
  assign do = do;
  always @(posedge clk) begin
    if(di == 0) begin
      do <= {do[1],do[0]};
    end else begin
      do <= { do[0], ~do[0] };
    end
  end
endmodule
```/Vivado_Projects/Vivado_Projects_Shared_Files/Module_Libraries/Adder_32_to_64/vhdl/README.md
# Adder 32-to-64:

## Files Included:
- `adder_32_to_64.vhdl`
- `tb_adder_32_to_64.vhd`
- `run_adder_32_to_64_tb.tcl`

## Vivado Files Included:
- `adder_32_to_64.vh`
- `tb_adder_32_to_64.v`

## Functionality:
The adder_32_to_64 block is responsible for adding two 32-bit numbers and putting the result in a 64-bit register. The block supports signed and unsigned addition.
The block is connected to two 32-bit input registers and one 64-bit output register. The two 32-bit input registers are connected to the input ports `b` and `a`. The 64-bit output register is connected to the output port `f`.
The `f` output is a 64-bit register that holds the sum of adding the `a` and `b` inputs.

## Running the Testbench:
Launch Vivado and create a project.
Add the `adder_32_to_64.v` file and the `tb_adder_32_to_64.v` file to the project.
Add the `run_adder_32_to_64_tb.tcl` file to the project and run the TCL script.
This will add the `adder_32_to_64.vh` and the `tb_adder_32_to_64.vhd` files to the project.
The block must be configured before the testbench can be run. The `adder_32_to_64.vh` file contains the configuration blocks for the block. The configuration block for this block is located in the `tb_adder_32_to_64.vhd` file.
The testbench simulates the block by connecting the block to an external clock. To connect the block to the clock, add a `clk` port to the block instance and connect it to a clock signal. The `clk` value must be set to a constant value greater than 1. An example `adder_32_to_64` block is shown below:
```vhdl
-- adder_32_to_64 block
adder_32_to_64#2000 adder_32_to_64 (
.input_a(a),
.input_b(b),
.output_f(f),
.clk_period(6));
```
The `clk_period` value must be set to the desired clock period in ns. An example `adder_32_to_64` block with an `clk` port is shown below:
```vhdl
adder_32_to_64#2000 adder_32_to_64 (
.input_a(a),
.input_b(b),
.output_f(f),
.clk(clk));
```
The `clk` value must be set to the clock signal that connects the block to the external clock. The clk value must be set to a signal, not a constant value (since the constant `0` will represent a `0` value for the clock).
After the block is configured and the testbench is added to the project, the project is initialized and synthesized.
The default configuration of the block is with a `clk` signal connected to the block. The default `clk_period` value is set to 6 ns.
To run the testbench, the project must be set to be run in simulation mode by selecting the `run` menu and then selecting the `simulation` option.
Before running the testbench, the `tb_adder_32_to_64` must be set to the top level of the block hierarchy. After the block is connected to the external clock, the testbench can be run.
An example run of the testbench is shown below:
```
[root@hsdk-linux-x86-64 /opt/Xilinx/Vivado/2022.1]# vivado -mode tcl
Vivado Tcl Shell version 2022.1 (64-bit)
(C) Copyright 1991-2022 Xilinx, Inc. All Rights Reserved.

Xilinx Design Software and Documentation Disclaimers:
(C) Copyright 2022 Xilinx, Inc.
License Agreement:
  Xilinx xrun command:
    This software and documentation is owned by Xilinx and/or its
    licensors. These materials may be used/distributed under the
    terms of the GNU GENERAL PUBLIC LICENSE Version 2.0 (the "GPL"),
    included in the LICENSE file of this  to 64-bit register. This register holds the result of adding the two 32-bit inputs.

### Verilog Code:
```
module adder_32_to_64(
  input wire [31:0] a,
  input wire [31:0] b,
  output wire [63:0] f,
  input wire clk
);
  reg [63:0] f;
  always@(posedge clk) begin 
    f <= a+b;
  end
endmodule
```binary.  The GPL is also
    available at https://www.gnu.org/licenses/gpl.html.
  Xilinx run command:
    This license is for non-commercial use only.

    You are