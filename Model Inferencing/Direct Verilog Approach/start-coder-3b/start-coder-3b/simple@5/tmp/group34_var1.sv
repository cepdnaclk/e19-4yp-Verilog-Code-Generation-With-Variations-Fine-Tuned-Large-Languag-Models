```
module wire_assign( input in, output out );
    // assign out to in
    wire[1:0] clock;
    wire in_val;
    wire out_val;
    assign in_val = in;
    assign out_val = clock[0];
    always@(posedge in)
        clock[0] = in_val;
    always@(posedge in)
        clock[1] = in_val;
endmodule
```
### Verilog Example:
```
module wire_assign( input in, output out );
    // assign out to in
    wire[1:0] clock;
    wire in_val;
    wire out_val;
    assign in_val = in;
    assign out_val = clock[0];
    always@(posedge in)
        clock[0] = in_val;
    always@(posedge in)
        clock[1] = in_val;
endmodule
    //
    // test to see if signal is 1
    // assign out to in
    wire[1:0] clock;
    wire in_val;
    wire out_val;
    assign in_val = in;
    assign out_val = clock[0];
    always@(posedge in)
        assign out_val = clock[0];
    always@(posedge clock[0])
        assign out_val = clock[1];
    always@(posedge clock[1])
        assign out_val = clock[0];
    always@(posedge clock[1])
        assign out_val = clock[0];
endmodule
```/hw/verilog_to_fpga/verilog_to_fpga/verilog_to_fpga.py
# 
# 2018-04-03
# CSCI 4810 / 5810 - Fall 2018
# Verilog to FPGA
#
# The verilog_to_fpga.py tool has two modes:
#   - parse:    parse the given input file, and produce a data structure
#   - compile:  compile the data structure to produce a new file, and optional
#               verilog file
#
# parse:
#   input:  one file with verilog statements and comments of the form
#   /*
#   <verilog statement>
#   */
#
#   and output:
#   {
#     "<verilog statement>": {
#       "<verilog line>": {
#         "comment": "<verilog line comment>",
#         "loc": <line number>,
#         "contents": <contents of line>
#       }
#     }
#   }
#
# compile:
#   input:  one file with the parsed verilog data structure
#   and output:
#   {
#     "<verilog statement>": {
#       "<verilog line>": {
#         "comment": "<verilog line comment>",
#         "loc": <line number>,
#         "contents": <contents of line>
#       }
#     }
#   }
#
# The output verilog file is generated on the fly, and is equivalent to the
# input verilog file except of the following:
#   1) module inputs are replaced with wires for each module, and wires are
#      replaced with registers if the wire width is non-trivial
#   2) module outputs are replaced with wires for each module, and assign
#      statements are removed from the module
#   3) wire assignments are added to the top level module, with the wire
#      assignments coming before the module
#   4) other modules are moved to the top level, with the module name as the
#      wire name
#
# An example of the data structure to use with compile is:
# {
#     "module wire_assign": {
#         "assign out = in": {
#             "comment": "// assign out to in",
#             "loc": 6,
#             "contents": "assign out = in"
#         },
#         "module wire_assign( input in, output out )": {
#             "comment": "// Create a module with one input and one output that behaves like a wire",
#             "loc": 5,
#             "contents": "module wire_assign( input in, output out )"
#         },
#     }
# }
#
# The module inputs are replaced with the wire inputs, and the module outputs
# are replaced with wire outputs.  The assign statements are added as wire
# assignments to the top level module.  The top level module is renamed to the
# module name, and the module inputs are assigned to the wire inputs and the
# module outputs are assigned to the wire outputs.

import sys
import re
import pprint
import argparse
import random

#
# Verilog parser
#

def parse_input(input_file, debug=False):
    '''Parse a verilog file, and return a data structure.

    The input file is assumed to be a single file containing the verilog
    statements and comments '''
    #
    # Data structure
    # {
    #     "<verilog statement>": {
    #         "<verilog line>": {
    #             "comment": "<verilog line comment>",
    #             "loc": <line number>,
    #             "contents": <contents of line>
    #         }
    #     }
    # }
    #
    data = {}
    with open(input_file, 'r') as inf:
        for line_number, line in enumerate(inf, start=1):
            #
            # Skip empty lines and comments
            #
            line = line.lstrip()
            if len(line) == 0 or line.startswith('//'):
                continue
            #
            # Parse verilog statement
            #
            m = re.match('^([a-zA-Z_][a-zA-Z0-9_]*)( *\([^)]*\))? *([a-zA-Z_][a-zA-Z0-9_]*)(=|\+=|\-=)( *\([^]]*\))?')
            if not m:
                raise Exception('Could not parse verilog statement on line %d' % line_number)
            statement = m.group(1).strip()
            if statement not in data:
                data[statement] = {}
            #
            # Parse verilog line
            #
            # TODO:  match line and comments
            #
            m = re.match('^ *([a-zA-Z0-9_.]+)( *;)?', line)
            if not m:
                raise Exception('Could not parse verilog line on line %d' % line_number)
            contents = m.group(1).strip()
            comment = ''
            if m.group(2):
                comment = m.group(2).strip()
            data[statement][contents] = {
                'comment': comment,
                'loc': line_number,
                'contents': contents
            }
    return data

#
# Verilog compiler
#

def compile_input(input_file, output_file, debug=False):
    '''Compile a verilog file, and return a data structure.

    The input file is assumed to be the output from parse_input, and is
    modified in-place.  The output file is written to the top level module. '''
    #
    # Data structure
    # {
    #     "<verilog statement>": {
    #         "<verilog line>": {
    #             "comment": "<verilog line comment>",
    #             "loc": <line number>,
    #             "contents": <contents of line>
    #         }
    #     }
    # }
    #
    data = {}
    with open(input_file, 'r') as inf, open(output_file, 'w') as outf:
        for line_number, line in enumerate(inf, start=1):
            #
            # Skip empty lines and comments
            #
            line = line.lstrip()
            if len(line) == 0 or line.startswith('//'):
                continue
            #
            # Parse verilog statement
            #
            m = re.match('^([a-zA-Z_][a-zA-Z0-9_]*)( *\([^)]*\))? *([a-zA-Z_][a-zA-Z0-9_]*)(=|\+=|\-=)( *\([^]]*\))?')
            if not m:
                raise Exception('Could not parse verilog statement on line %d' % line_number)
            statement = m.group(1).strip()
            if statement not in data:
                data[statement] = {}
            #
            # Parse verilog line
            #
            # TODO:  match line and comments
            #
            m = re.match('^ *([a-zA-Z0-9_.]+)( *;)?', line)
            if not m:
                raise Exception('Could not parse verilog line on line %d' % line_number)
            contents = m.group(1).strip()
            comment = ''
            if m.group(2):
                comment = m.group(2).strip()
            data[statement][contents] = {
                'comment': comment,
                'loc': line_number,
                'contents': contents