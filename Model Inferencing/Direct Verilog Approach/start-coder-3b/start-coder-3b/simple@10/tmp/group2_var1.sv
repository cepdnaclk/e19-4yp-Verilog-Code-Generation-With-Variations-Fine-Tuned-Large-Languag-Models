module test;
packed mystruct;
reg [7:0] a;
assign #25 a = 1;
assign #10 b = 1;
always begin
    mystruct.a = #10 a;
end
endmodule
"""


/README.md
# VerilogVerse

VerilogVerse is a tool developed to automatically generate different variations of Verilog code files. The tool is implemented using Python and relies on the SPARK (Systematic Parametric Verification) framework. The tool has been tested on Linux.

## Dependencies

* SPARK
    * SPARK Tools
* Python 3.6.6
    * argparse
    * xml (included in Python 3.6.6)
    * importlib

## Usage

```
usage: run.py [-h] [-b BASE] [-d DVAR] [-n NUM] [-p PROTOCOL] [-o OUTPUT]

optional arguments:
  -h, --help            show this help message and exit
  -b BASE, --base BASE  Input file with base Verilog code.
  -d DVAR, --dvar DVAR  Input file with different variable values.
  -n NUM, --num NUM     Number of variations to be generated.
  -p PROTOCOL, --protocol PROTOCOL
                        Input file with protocol values.
  -o OUTPUT, --output OUTPUT
                        Output file with generated variations.
```

## Example

```
$./run.py -b base.v -d dvar.v -n 10 -p protocol.v -o output.v
```

## Code Generation

* VerilogVerse can generate variations of different components.
* Two main components that can be generated with VerilogVerse are:
  * Wires
  * Registers
* Wires are modified using packed structure.
* Registers are modified using packed structure along with modifying assignments.
/scripts/generate_base_component.py
#!/usr/bin/python3

import argparse
import re

parser = argparse.ArgumentParser(description='Verilog Verse')
parser.add_argument('-b', '--base', help='Input file with base Verilog code.')
parser.add_argument('-d', '--dvar', help='Input file with different variable values.')
parser.add_argument('-n', '--num', type=int, help='Number of variations to be generated.')
parser.add_argument('-p', '--protocol', help='Input file with protocol values.')
parser.add_argument('-o', '--output', help='Output file with generated variations.')

args = parser.parse_args()

components = ['wire','reg']

# Read base code
with open(args.base, 'r') as base:
	base_contents = base.readlines()

# Read different variable values
dvar_contents = None
with open(args.dvar, 'r') as dvar:
	dvar_contents = dvar.readlines()

# Read protocol values
protocol_contents = None
with open(args.protocol, 'r') as protocol:
	protocol_contents = protocol.readlines()

# Generate component variations
for component in components:
	variations = []
	count = 0

	# Get variations
	for dvar_content in dvar_contents:
		dvar_