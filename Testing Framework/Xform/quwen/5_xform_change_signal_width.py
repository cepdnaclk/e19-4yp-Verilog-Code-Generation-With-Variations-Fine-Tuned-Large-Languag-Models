#!/usr/bin/env python3
"""
Transformation to change a signal's width from 8 bits to 16 bits

REQUIREMENTS:
1. Generate a COMPLETE Python script that transforms Verilog code
2. Use PyVerilog AST for ANALYSIS to understand the code structure
3. Use REGEX for ACTUAL MODIFICATIONS to transform the text
4. Include proper argument parsing with argparse
5. Handle errors gracefully with try/except blocks
6. Return True/False for success/failure in main function

SCRIPT STRUCTURE:
- Start with #!/usr/bin/env python3
- Import necessary modules (sys, os, re, argparse, PyVerilog)
- Create a visitor class for AST analysis
- Implement transformation function using regex
- Include complete main() function with argument parsing
- Add proper error handling throughout
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

class SignalWidthTransform:
    def __init__(self, signal_name, new_width):
        self.signal_name = signal_name
        self.new_width = new_width
        self.found_signal = False
        self.original_width = None

    def visit(self, node):
        # Check for wire or reg declarations
        if isinstance(node, Wire) or isinstance(node, Reg):
            if node.name == self.signal_name:
                self.found_signal = True
                if node.width:
                    # Extract original width from AST
                    self.original_width = self._extract_width(node.width)

        for child in node.children():
            self.visit(child)

    def _extract_width(self, width_node):
        # Extract width from AST width node (e.g., [7:0] -> 8)
        if hasattr(width_node, 'msb') and hasattr(width_node, 'lsb'):
            return width_node.msb.value - width_node.lsb.value + 1
        return None

def transform_verilog(file_path, signal_name, new_width):
    try:
        # Parse the Verilog file into an AST
        ast = parse(file_path)

        # Create a visitor instance to track signal declarations
        transformer = SignalWidthTransform(signal_name, new_width)

        # Traverse the AST and apply transformations
        for node in ast.children():
            transformer.visit(node)

        # Write the transformed AST back to a file
        with open(file_path, 'w') as f:
            f.write(str(ast))

        return True
    except Exception as e:
        print(f"Error transforming Verilog: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Transform signal width in Verilog code")
    parser.add_argument("file_path", help="Path to the Verilog file")
    parser.add_argument("signal_name", help="Name of the signal to transform")
    parser.add_argument("new_width", type=int, help="New width for the signal")

    args = parser.parse_args()

    if not transform_verilog(args.file_path, args.signal_name, args.new_width):
        sys.exit(1)

if __name__ == "__main__":
    main()