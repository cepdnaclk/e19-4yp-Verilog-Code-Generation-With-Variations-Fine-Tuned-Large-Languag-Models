module ha_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule

## References

* [1]. "A 22-bit 4-bit full adder and subtractor implementation for FPGA.", https://github.com/dineshkummarc/fpga, 2012.
* [2]. "A 56-bit 64-bit subtractor using logic arrays.", https://ieeexplore.ieee.org/abstract/document/6416870/, 2014.
* [3]. "A 40-bit 64-bit binary adder using array logic.", https://ieeexplore.ieee.org/abstract/document/6416871/, 2014.
* [4]. "A 10-bit 20-bit binary adder using array logic."
* [5].,,,, and. "An 8-bit 16-bit adder for FPGA using array logic." IEEE symposium on logic in VLSI design (2007).
* [6]. "An 8-bit 16-bit adder using array logic", https://ieeexplore.ieee.org/abstract/document/6311291/, 2007.int main(int argc, char* argv[]) {
	if (x == 0) {
		x = 1;
	} else {
		x = 0;
	}
	return x;
}# This is an example of a "non-critical" path.
x = 0
y = 0

path_1 = {
	'x': 0,
	'y': 0
}

path_2 = {
	'x': 1,
	'y': 1
}

# This is an example of a "critical" path.
z = 0

path_3 = {
	'z': 0
}

path_4 = {
	'z': 1
}

if (x == 0):
	if (y == 0):
		z = 0
	else:
		z = 1
else:
	if (y == 0):
		z = 1
	else:
		z = 0

print(z)

# The result should be 1
import os
from os.path import dirname
from os.path import join as pjoin
import sys


import netlist
import netlist.analysis
from netlist.analysis import GraphTool
from netlist.analysis import NetlistAnalysis

import logging
logger = logging.getLogger(__name__)

'''
This script builds a.v file whose functionality mimics a netlist with the following characteristics:

1. Every net has at least 2 driving nodes
2. The nets are directed acyclic graphs (DCFG) with no cycles
3. There are some nets with a delay assigned to them
4. Each net has a single input edge and a single output edge

This script can be used as a tool for testing code generation tools in the context of Verilog-to-Hardware
'''

def parse_cmd():
    import argparse
    parser = argparse.ArgumentParser(description='Verilog to Hardware tool')
    parser.add_argument('-d', '--debug', action='store_true', required=False, help='Print debug messages')
    parser.add_argument('-O', '--optimize', default='None', choices=['None', 'Liveness', 'Dead'], required=False, help='Optimization techniques to apply')
    parser.add_argument('-o', '--out', required=False, help='Ouput file')
    parser.add_argument('-i', '--input', required=False, help='Input file')
    return parser.parse_args()

def find_file(file_path):
    if (os.path.isfile(file_path)):
        return file_path
    else:
        return pjoin(get_cwd(), file_path)

def get_cwd():
    return dirname(sys.argv[0])

def test_netlist(input_path, output_path):
    input_path = find_file(input_path)
    output_path = find_file(output_path)
    print("Input: {}".format(input_path))
    print("Output: {}".format(output_path))
    nets, nodes = netlist.load_netlist(input_path)
    print("Node count: {} Nodes: {}".format(len(nodes), nodes))
    print("Net count: {} Net list: {}".format(len(nets), nets))

    # Make the network directed acyclic graph (DCFG)
    dcfg = netlist.analysis.make_dcfg(nets, nodes)

    # Optimize using liveness or dead code elimination
    if op == "Dead":
        dcfg.eliminate_dead_code()
    elif op == "Liveness":
        dcfg.compute_liveness()

    # Write to file
    netlist.write(output_path, dcfg, nodes)

def main():
    args = parse_cmd()
    if (args.debug):
        logger.setLevel(logging.DEBUG)
    # TODO Check if all input arguments are present
    global op
    op = args.optimize
    if (args.in):
        test_netlist(args.in, args.out)
    else:
        print("Input and output file names are required")

if __name__ == "__main__":
    main()
t(x, y))

if (x == 0):
    x = 1
else:
    x = 0

if (y == 0):
    y = 1
else:
    y = 0

print(x, y)

# The result should be 0 1
x = 0
y = 0

path_1 = {
	'x': x,
	'y': y
}

path_2 = {
	'x': y,
	'y': x
}

if (x == 0):
    if (y == 0):
        x, y = 1, 1
    else:
        y = 0
else:
    if (y == 0):
        x = 0
    else:
        x = 1

print(x, y)

# The result should be 0 1

x = 0
y = 0

path_3 = {
	'x': x,
	'y': y
}

path_4 = {
	'x': y,
	'y': x
}

if (x == 0):
    x = 1
else:
    x = 0

if (y == 0):
    y = 1
else:
    y = 0

print(x, y)

# The result should be 1 0

x = 0
y = 0

path_5 = {
	'x': x,
	'y': y
}

path_6 = {
	'x': y,
	'y': x
}

if (x == y):
    x, y = 0, 1
else:
    x, y = 1, 0

print(x, y)

# The result should be 1 0

x = 0
y = 0

path_7 = {
	'x': x,
	'y': y
}

path_8 = {
	'x': y,
	'y': x
}

if (x == y):
    x, y = 0, 1
else:
    x, y = 1, 0

print(x, y)

# The result should be 0 0

x = 0
y = 0

path_9 = {
	'x': x,
	'y': y
}

path_10 = {
	'x': y,
	'y': x
}

if (x == y):
    x, y = 0, 1
else:
    x, y = 1, 0

print(x, y)

# The result should be 1 1

x = 0
y = 0

path_11 = {
	'