module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s )
begin
end
else
if ( inside(s, {1'b1}) )
begin
deassign q;
deassign q_b;
end
else
begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r is 1'b0 )
begin
end
else
if ( not inside(r, {1'b0}) )
begin
deassign q;
deassign q_b;
end
else
begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
### Verification Instruction:
To check if `r` is outside a constant declared in interface scope, check for `1'b0` first.
```
$ verilator-yosys -l test.v
...
r (1), 1'b0
...
```
Then check `not` operator before `inside` check with `1'b0` inside the constant.
```
$ verilator-yosys -l test.v
...
r (1), 1'b0
...
```
/docs/manual/yosys-command-reference-manual.md
---
layout: default
---

Welcome to the Yosys Command Reference Manual!

Yosys is a Verilog parser and compiler. It can be run as a standalone tool or as a Yosys frontend for synthesis tools. It accepts standard Verilog input, and supports a wide range of synthesis and analysis options. It can be used to extract signal netlists from hardware designs, and to automatically synthesize or optimize signal netlists using high-level synthesis tools such as ABC and VPR.

This guide provides a reference on all the Yosys commands and options available for users who are familiar with Verilog and synthesis tools. The guide is split into three sections:

- [Yosys Commands](#yosys-commands) - The commands you can run in Yosys to extract and optimize circuit netlists, or to interface with synthesis tools.
- [Yosys Options](#yosys-options) - Options you can pass to Yosys to customize its behavior.
- [Yosys Tips](#yosys-tips) - A set of useful tips and tricks to help you use Yosys effectively.

## Yosys Commands

All Yosys commands start with `yosys`. For example, to extract a Verilog source file from a Verilog file, run `yosys -E <file.v>`. You can also use a relative path to the file. For example, `yosys -E../test.v`.

Some examples of Yosys commands are as follows:

- To extract a netlist from a Verilog input file: `yosys -E <file.v>`
- To print a netlist: `yosys -p <file.v>`
- To extract a netlist from a SymbiFlow RTL file: `yosys -E <file.sv>`
- To extract a netlist from a Yosys-compatible file: `yosys -E <file.v>`
- To synthesize a netlist using ABC: `yosys -Y abc -p <file.v>`
- To synthesize a netlist using Yosys ABC-like command line interface: `yosys -Y abc -l abc.txt <file.v>`
- To synthesize a netlist using VPR: `yosys -Y vpr -p <file.v>`
- To synthesize a netlist using Yosys VPR-like command line interface: `yosys -Y vpr -l vpr.txt <file.v>`

## Yosys Options

These are the set of options you can pass to Yosys to customize its behavior. These options can be passed either as arguments to the command, or by prefixing the option with a double dash (`--`). For example, the following command will synthesize a netlist using ABC:

```
yosys -Y abc -p <file.v>
```

Some of the more commonly used Yosys options:

- `-h`, `--help`: print Yosys help menu
- `-v`, `--version`: print Yosys version
- `-p`, `--parse`: extract a netlist from a Verilog file, and print it to stdout
- `-E`, `--elab`: extract a Verilog source file from a Verilog file
- `-Y`, `--Yosys-tech`: select the technology used by the synthesis tool.
- `-q`, `--quiet`: supress most output
- `-d`, `--debug`: print additional output to help you debug Yosys
- `-l`, `--log`: log all Yosys commands
- `-l <log_file>`, `--log <log_file>`: log all Yosys commands to a specified file
- `-L`, `--log-file`: log Yosys commands to a specified file
- `-L <log_file>`, `--log-file <log_file>`: log all Yosys commands to a specified file
- `-b`, `--backdoor`: execute a backdoor command from a specified file
- `-b <file>`, `--backdoor <file>`: execute a backdoor command from a specified file
- `-t`, `--testbench`: execute a Verilog testbench
- `-i`, `--include`: include an additional directory for Verilog compilation
- `-i <dir>`, `--include <dir>`: include an additional directory for Verilog compilation
- `-s`, `--script`: execute a Yosys script
- `-s <file>`, `--script <file>`: execute a Yosys script
- `-r`, `--read`: read a Verilog source file as input to Yosys
- `-r <file>`, `--read <file>`: read a Verilog source file as input to Yosys
- `-w`, `--write`: write an output file using the Verilog format
- `-w <file>`, `--write <file>`: write