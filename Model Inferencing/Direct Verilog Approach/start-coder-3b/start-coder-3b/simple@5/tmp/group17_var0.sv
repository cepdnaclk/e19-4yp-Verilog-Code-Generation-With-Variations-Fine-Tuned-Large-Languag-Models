module ALU (output[31:0] Result, input[31:0] ArgA, ArgB, input Clk);
specify
    specparam tRise = 5, tFall = 4;
    (Clk *> Result) = (tRise, tFall);
endspecify
endmodule

```

### Code Snippet:

For more information see the [documentation](https://docs.verilogtorouting.org/en/latest/reference/verilator_vcd_format.html).

### References:

[Verilator Verilog Trace Format](https://docs.verilogtorouting.org/en/latest/reference/verilator_vcd_format.html)

[How to Read VCD Files](https://www.verilogtorouting.org/posts/how-to-read-vcd-files)
/P5/README.md
# Practical 5

## Instructions

### Download the project (if not already done)

* `git clone https://github.com/eelcohalverstoorn/Digital-System-Design-2.git hw5`

### Navigate into the project (`cd hw5`)

* `cd hw5`

### Build the project

* `make`

### Run the project (first time, or after any changes)

* `./run.sh`

### Run the project (when not first time)

* `./run.sh`

### Clean the project

* `make clean`
/P1/README.md
# Practical 1

## Instructions

### Download the project (if not already done)

* `git clone https://github.com/eelcohalverstoorn/Digital-System-Design-2.git hw1`

### Navigate into the project (`cd hw1`)

* `cd hw1`

### Build the project

* `make`

### Run the project (first time, or after any changes)

* `./run.sh`

### Run the project (when not first time)

* `./run.sh`

### Clean the project

* `make clean`

### Files

These are the files that were used to check the project.

* [top.v](top.v)
* [run.sh](run.sh)

You can run it with `bash run.sh`.
/P3/README.md
# Practical 3

## Instructions

### Download the project (if not already done)

* `git clone https://github.com/eelcohalverstoorn/Digital-System-Design-2.git hw3`

### Navigate into the project (`cd hw3`)

* `cd hw3`

### Build the project

* `make`

### Run the project (first time, or after any changes)

* `./run.sh`

### Run the project (when not first time)

* `./run.sh`

### Clean the project

* `make clean`

### Files

The following files are the part of this practical. They are the files that the practical instructors use to check their solutions.

* [Adder.v](Adder.v)
* [ALU_Adder.v](ALU_Adder.v)
* [MUX2.v](MUX2.v)
* [MUX4.v](MUX4.v)
* [Register.v](Register.v)
* [ROM.v](ROM.v)
* [ALU.v](ALU.v)
* [top.v](top.v)
* [run.sh](run.sh)

You can run it with `bash run.sh`.
/P4/ALU.py
#!/usr/bin/env python3

'''
This is a python script to convert a Verilog ALU module to a VHDL ALU module.

The following ALU instructions are implemented:

* ADD
* ADDC
* ADDCI
* SUB
* SUBC
* SUBCI
* AND
* OR
* XOR
* XORCI
* COMP
* INC
* DEC
* LSR
* ASR
* LSL
* BCD
* BTOD


This script can convert a Verilog ALU module to either a VHDL ALU module with an ASIC synthesizer, or a VHDL ALU module without an ASIC synthesis.

Usage:

python3 ALU.py <ALU_module.v> <ALU_module.vhdl> <synthesis_type>

Where <synthesis_type> can be ASIC or no_ASIC.
'''

from sys import argv

# Convert the module name to the module name in VHDL.
def vhdl_module_name(module):
    module = module[0] + module[1:].replace('_', '')
    module = module.replace('Adder', 'ALU')
    return module


print("Converting Verilog ALU module to VHDL ALU module.")

# Read the file.
with open(argv[1]) as file:
    lines = file.readlines()


# Get the module name.
module = ""
for line in lines:
    if line[:2] == "module":
        module = line[line.find("ALU"):]
        module = module.replace('ALU(', '')
        module = module.replace(');', '')
        module = module.replace(',', '')
        module = module.replace(':', '')
        module = module.replace('[0:3]', '')

module = vhdl_module_name(module)

print("The module name in VHDL is", module)

# Replace the module name.
for i, line in enumerate(lines):
    if line[:2] == "module":
        lines[i] = "library ieee;\nuse ieee.std_logic_1164.all;\nlibrary std;\nuse std.textio.all;\n"
        lines[i] = lines[i] + "entity " + module + " is\n"
        lines[i] = lines[i] + "    port (\n"
        lines[i] = lines[i] + "        Clk : in std_logic;\n"
        lines[i] = lines[i] + "        Reset : in std_logic;\n"
        lines[i] = lines[i] + "        ArgA : in std_logic_vector (15 downto 0);\n"
        lines[i] = lines[i] + "        ArgB : in std_logic_vector (15 downto 0);\n"
        lines[i] = lines[i] + "        Control : in std_logic_vector (7 downto 0);\n"
        lines[i] = lines[i] + "        Output : out std_logic_vector (31 downto 0)\n"
        lines[i] = lines[i] + "    );\n"
        lines[i] = lines[i] + "end;\n"
        lines[i] = lines[i] + "architecture foo of " + module + " is\n"
        lines[i] = lines[i] + "    constant ADD : std_logic_vector (7 downto 0) := x\"00\";\n"
        lines[i] = lines[i] + "    constant ADDC : std_logic_vector (7 downto 0) := x\"01\";\n"
        lines[i] = lines[i] + "    constant ADDCI : std_logic_vector (7 downto 0) := x\"02\";\n"
        lines[i] = lines[i] + "    constant SUB : std_logic_vector (7 downto 0) := x\"04\";\n"
        lines[i] = lines[i] + "    constant SUBC : std_logic_vector (7 downto 0) := x\"05\";\n"
        lines[i] = lines[i] + "    constant SUBCI : std_logic_vector (7 downto 0) := x\"06\";\n"
        lines[i] = lines[i] + "    constant AND : std_logic_vector (7 downto 0) := x\"08\";\n"
        lines[i] = lines[i] + "    constant OR : std_logic_vector (7 downto 0) := x\"0C\";\n"
        lines[i] = lines[i] + "    constant XOR : std_logic_vector (7 downto 0) := x\"10\";\n"
        lines[i] = lines[i] + "    constant XORCI : std_logic_vector (7 downto 0) := x\"14\";\n"
        lines[i] = lines[i] + "    constant COMP : std_logic_vector (7 downto 0) :=