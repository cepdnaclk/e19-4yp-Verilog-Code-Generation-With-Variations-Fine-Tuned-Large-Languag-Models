#!/usr/bin/env python3
"""
Transformation to change a module name.
This version uses string manipulation after identifying the module declaration.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class ModuleNameVisitor:
    """
    AST visitor that identifies modules to rename.
    """

    def __init__(self, from_name, to_name):
        self.from_name = from_name
        self.to_name = to_name
        self.changes_made = []
        self.found_module = False

    def visit(self, node):
        """Visit a node and identify modules to rename."""
        if isinstance(node, Node):
            if isinstance(node, ModuleDef) and node.name == self.from_name:
                self.found_module = True
                self.changes_made.append(
                    f"Changed module name from '{self.from_name}' to '{self.to_name}'"
                )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_module_name(input_file, output_file, from_name, to_name):
    """
    Transform module name.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        from_name (str): Original module name
        to_name (str): New module name

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify modules to rename
        visitor = ModuleNameVisitor(from_name, to_name)
        visitor.visit(ast)

        # Check if the module was found
        if not visitor.found_module:
            print(f"Warning: Module '{from_name}' not found")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Replace module declaration
        pattern = r"\bmodule\s+" + re.escape(from_name) + r"\b"
        replacement = f"module {to_name}"
        modified_content = re.sub(pattern, replacement, content)

        # Replace endmodule comments if they reference the module name
        pattern = r"endmodule\s*//\s*" + re.escape(from_name)
        replacement = f"endmodule // {to_name}"
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
    parser = argparse.ArgumentParser(description="Transform module name")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--from", dest="from_name", required=True, help="Original module name"
    )
    parser.add_argument("--to", dest="to_name", required=True, help="New module name")

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_module_name(
        args.input_file, args.output_file, args.from_name, args.to_name
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
