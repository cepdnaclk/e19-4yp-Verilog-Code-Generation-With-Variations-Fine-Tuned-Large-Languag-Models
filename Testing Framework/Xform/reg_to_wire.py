#!/usr/bin/env python3
"""
Transformation to change reg variables to wire using PyVerilog.
This version uses string manipulation after identifying the reg declarations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class RegToWireVisitor:
    """
    AST visitor that identifies reg declarations to transform to wire.
    """

    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = []
        self.reg_declarations = []

    def visit(self, node):
        """Visit a node and identify reg declarations."""
        if isinstance(node, Node):
            if isinstance(node, Decl):
                for item in node.list:
                    if isinstance(item, Reg):
                        # If targeting a specific variable, check the name
                        if self.target_variable is None or (
                            hasattr(item, "name") and item.name == self.target_variable
                        ):

                            # Store information about the reg declaration
                            width = ""
                            if item.width:
                                msb = item.width.msb.value
                                lsb = item.width.lsb.value
                                width = f"[{msb}:{lsb}] "

                            self.reg_declarations.append(
                                {"name": item.name, "width": width}
                            )
                            self.changes_made.append(
                                f"Changed '{item.name}' from 'reg' to 'wire'"
                            )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_reg_to_wire(input_file, output_file, target_variable=None):
    """
    Transform reg variables to wire.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        target_variable (str, optional): If provided, only transform this variable

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify reg declarations
        visitor = RegToWireVisitor(target_variable)
        visitor.visit(ast)

        # Check if any changes were identified
        if not visitor.changes_made:
            if target_variable:
                print(
                    f"Warning: Variable '{target_variable}' not found or not declared as 'reg'"
                )
            else:
                print("Warning: No 'reg' variables found in file")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Replace reg declarations with wire in the content
        modified_content = content
        for decl in visitor.reg_declarations:
            # Match reg declaration with the correct width
            pattern = (
                r"\breg\s+"
                + re.escape(decl["width"])
                + r"\b"
                + re.escape(decl["name"])
                + r"\b"
            )
            replacement = f'wire {decl["width"]}{decl["name"]}'
            modified_content = re.sub(pattern, replacement, modified_content)

        # Write the modified content to the output file
        with open(output_file, "w") as f:
            f.write(modified_content)

        print(f"Output written to {output_file}")
        return True

    except Exception as e:
        print(f"Error processing file: {e}")
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and process the file."""
    parser = argparse.ArgumentParser(description="Transform reg variables to wire")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--variable",
        "-v",
        help="Specific variable to transform (default: all reg variables)",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_reg_to_wire(args.input_file, args.output_file, args.variable)

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())