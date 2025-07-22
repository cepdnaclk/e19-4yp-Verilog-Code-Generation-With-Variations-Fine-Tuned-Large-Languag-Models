module testbench ();
generate begin
data;
endGenerate
endmodule/verilog_testbenchgen/test_bench-generator.py
#!/usr/bin/env python3

import sys
import argparse
import os

##
# @file test_bench-generator.py
# @brief This script will generate test benches for Verilog programs.
# @author 
# @date 17/06/21
# @copyright
#
# Copyright 2021 University of Surrey
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The following comment blocks are for doxygen:

"""
This script will generate test benches for Verilog programs.

It will take a Verilog source file as input, and generate any test benches necessary
to test the specified system.

It will output the specified module to a file with the same name as the original
module, but with a '-tb' suffix.

It will insert into the above file the following block:

`instance testbench;
endmodule
`

This should be all the testbench code needed for the module.
"""

### Imports.
import fileinput
import re

### Code blocks.
### Find the file extension.
extension = "v"
if len(sys.argv) > 1:
    if extension not in sys.argv[1].lower():
        print("Fatal Error: File '" + str(sys.argv[1]) + "' does not have a.v extension.")
        exit()

### Parse the command line arguments.
parser = argparse.ArgumentParser(description="Generate Verilog test benches.")
parser.add_argument("source", help="name of source file")
parser.add_argument("-D", "--delay_inst", help="The delay for an instruction (default=8ns)", default="8ns")
parser.add_argument("-W", "--wrapper_path", help="The file path to the wrapper top module.", default="")
parser.add_argument("-O", "--output_dir", help="The directory to write the output to.", default="")
parser.add_argument("-i", "--insert", help="The line to insert into the wrapper file.", default="")

# Get the arguments.
args = parser.parse_args()

### Generate the test bench file.

# Set up the system
sys_name = args.source.replace(extension, '')
output_path = "" if not args.output_dir else (args.output_dir + "/" if not args.output_dir[len(args.output_dir)-1] == '/' else args.output_dir)
wrapper_path="" if not args.wrapper_path else (args.wrapper_path + "/" if not args.wrapper_path[len(args.wrapper_path)-1] == '/' else args.wrapper_path)

# Get the wrapper name (if specified)
wrapper_name = sys_name.replace(extension, '')

# Load the module
module = ""
with open(args.source, "r") as file:
    module = file.readlines()

# Find the module's port list.
module_ports = ""
for line in module:
    if re.match("module", line):
        module_ports = line.strip().split()[1]
        break

# Check that the specified module exists.
if sys_name not in module_ports:
    print("Fatal Error: Cannot find the module '" + str(sys_name) + "' in the list of modules")
    exit()

# Get the instance name
instance_name = sys_name.replace(extension, "_tb")

# Find the wrapper file.
wrapper_file = ""
if wrapper_path:
    wrapper_file = open(wrapper_path + instance_name + extension, "a+")
else:
    print("Fatal Error: Cannot find the specified wrapper file: " + str(wrapper_path))
    exit()

# Find the wrapper module.
sys.stdout = wrapper_file
print("module " + instance_name + " (" + module_ports + ")")
print("  " + module_ports + ";")
print("endmodule")
print()

# Load and write the test bench code.
test_bench = open(sys_name + extension, "a+")
test_bench.write("module " + instance_name + " (" + module_ports + ");\n")

# Insert any necessary code onto the top module.
if args.insert:
    test_bench.write(args.insert)

# Write the module code.
test_bench.write("  " + module_ports + ";\n")

# Write the test bench code.
test_bench.write("  initial begin\n")
test_bench.write("    $dumpfile(\"" + output_path + sys_name + ".vcd\");\n")
test_bench.write("    $dumpvars(0, " + sys_name + ");\n")
test_bench.write("    #" + args.delay_inst + "\n")
test_bench.write("    " + sys_name + " instance;\n")
test_bench.write("  end\n")

test_bench.write("  initial begin\n")
test_bench.write("    $dumpvarsdisable(0, " + sys_name + ");\n")
test_bench.write("  end\n")

# End the test bench.
test_bench.write("endmodule\n")
test_bench.close()
/verilog_testbenchgen/README.md
# Verilog Test Bench Generator

This script will generate test benches for Verilog programs.

It will take a Verilog source file as input, and generate any test benches necessary
to test the specified system.

It will output the specified module to a file with the same name as the original
module, but with a '-tb' suffix.

It will insert into the above file the following block:

instance testbench;
endmodule

This should be all the testbench code needed for the module.

## Usage

`python3 test_bench-generator.py <source_file> [options]`

## Options

-h, --help                      print this help message and exit

--delay_inst=VALUE              The delay for an instruction (default=8ns)

--wrapper_path=VALUE            The file path to the wrapper top module.

--output_dir=VALUE              The directory to write the output to.

--insert=VALUE                  The line to insert into the wrapper file.

## Example

`python3 test_bench-generator.py --delay_inst=10ns --wrapper_path="C:/Users/me/Documents/My Documents/Work/ISE/FPGA/testbench" hello_world.v`

This example will create a testbench for the HelloWorld module that is found in
the hello_world.v module.

The resulting testbench will be located at hello_world_tb.v.

The delay for each instruction will be 10ns, and the top module for the wrapper is
found in the C:/Users/me/Documents/My Documents/Work/ISE/FPGA/testbench folder.
/README.md
# FPGA-Verilog-Utilities

This repository contains some scripts I have written to enhance Verilog development in Verilog. I have listed them below.

## verilog_testbenchgen

This file contains a Python script to generate test benches for Verilog programs.

## vhdl_testbenchgen

This file contains a Python script to generate test benches for VHDL programs.

## verilog_vcd-extractor

This file contains a Python script to extract variables from VCD files.
/verilog_vcd-extractor/README.md
# VCD Extractor

This script will take a VCD file as input, and will print all the variables within it to the console.

## Usage

`python3 vcd-extractor.py <vcd_file>`

## Example

`python3 vcd-extractor.py --delay=10ns hello_world.vcd`

This example will print all the variables found in the hello_world.vcd file to the console.

The delay for each instruction will be 10ns.