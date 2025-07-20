#!/usr/bin/env python3
"""
Transform wire declarations to reg declarations in a Verilog module
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class WireToRegVisitor:
    """AST visitor that identifies wire declarations to transform."""

    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = []
        self.wire_declarations = []

    def visit(self, node):
        """Visit AST nodes and identify wire declarations."""
        if isinstance(node, Node):
            if isinstance(node, Decl):
                for item in node.list:
                    if isinstance(item, Wire):
                        # If targeting a specific variable, check the name
                        if self.target_variable is None or (
                            hasattr(item, "name") and item.name == self.target_variable
                        ):

                            # Store information about the wire declaration
                            width = ""
                            if item.width:
                                msb = item.width.msb.value
                                lsb = item.width.lsb.value
                                width = f"[{msb}:{lsb}] "

                            self.wire_declarations.append(
                                {"name": item.name, "width": width}
                            )
                            self.changes_made.append(
                                f"Changed '{item.name}' from 'wire' to 'reg'"
                            )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_wire_to_reg(input_file, output_file, target_variable=None):
    """
    Transform wire variables to reg.

    Args:
        input_file (str): Path to input file
        output_file (str): Path to output file
        target_variable (str, optional): Name of specific variable to transform. Defaults to None.

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse with PyVerilog to analyze structure
        ast, directives = parse([input_file])

        # Use visitor to identify wire declarations
        visitor = WireToRegVisitor(target_variable)
        visitor.visit(ast)

        # Check if anything was found to transform
        if not visitor.changes_made:
            print("Warning: No targets found for transformation")
            return False

        # Apply transformations using regex on the original text
        modified_content = content
        for element in visitor.wire_declarations:
            # Use regex to make the actual text changes
            pattern = r"\\bwire\\s+" + element["name"] + r"\\b"
            replacement = "reg " + element["name"]
            modified_content = re.sub(pattern, replacement, modified_content)

        # Write output
        with open(output_file, "w") as f:
            f.write(modified_content)

        print(f"Transformation completed. Output written to: " + output_file)
        return True

    except Exception as e:
        print(f"Error: " + str(e))
        import traceback

        traceback.print_exc()
        return False


def main():
    """Command line interface."""
    parser = argparse.ArgumentParser(description="Verilog transformation tool")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--target", help="Target variable for transformation")

    args = parser.parse_args()

    if not os.path.exists(args.input_file):
        print("Error: Input file not found: " + args.input_file)
        return 1

    success = transform_wire_to_reg(args.input_file, args.output_file, args.target)
    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
