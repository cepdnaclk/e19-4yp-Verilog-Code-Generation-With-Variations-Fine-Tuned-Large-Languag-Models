#!/usr/bin/env python3
"""
Transformation to rename a port in a Verilog module.
Fixed version with correct regex patterns.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class RenamePortVisitor:
    """
    AST visitor that identifies ports to rename.
    """

    def __init__(self, from_name, to_name):
        self.from_name = from_name
        self.to_name = to_name
        self.changes_made = []
        self.ports_found = False
        self.port_info = None

    def visit(self, node):
        """Visit a node and identify ports to rename."""
        if isinstance(node, Node):
            # Check port declarations
            if isinstance(node, Ioport):
                for child in node.children():
                    if hasattr(child, "name") and child.name == self.from_name:
                        self.ports_found = True
                        # Store information about the port
                        port_type = type(child).__name__  # Input, Output, or Inout
                        width = None
                        if hasattr(child, "width") and child.width:
                            if isinstance(child.width, Width):
                                # Extract width information
                                msb = child.width.msb
                                lsb = child.width.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    width = f"[{msb.value}:{lsb.value}]"

                        self.port_info = {
                            "type": port_type.lower(),  # input, output, or inout
                            "width": width,
                        }

                        self.changes_made.append(
                            f"Renamed port '{self.from_name}' to '{self.to_name}'"
                        )

            # Continue visiting all child nodes
            for child in node.children():
                self.visit(child)


def transform_rename_port(input_file, output_file, from_name, to_name):
    """
    Transform a port name.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        from_name (str): Original port name
        to_name (str): New port name

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify ports to rename
        visitor = RenamePortVisitor(from_name, to_name)
        visitor.visit(ast)

        # Check if the port was found
        if not visitor.ports_found:
            print(f"Warning: Port '{from_name}' not found")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Perform the transformations using regex
        modified_content = content

        # 1. Replace in port list
        port_list_pattern = r"(\b" + re.escape(from_name) + r"\b)(\s*,|\s*\))"
        port_list_replacement = to_name + r"\2"
        modified_content = re.sub(
            port_list_pattern, port_list_replacement, modified_content
        )

        # 2. Replace in port declaration
        if visitor.port_info:
            port_type = visitor.port_info["type"]
            width_str = visitor.port_info["width"] or ""
            if width_str:
                # Escape special characters in width string
                width_str = re.escape(width_str) + r"\s+"

            port_decl_pattern = (
                r"\b" + port_type + r"\s+" + width_str + re.escape(from_name) + r"\b"
            )
            port_decl_replacement = (
                f"{port_type} {width_str.replace('\\s+', ' ')}{to_name}"
            )
            modified_content = re.sub(
                port_decl_pattern, port_decl_replacement, modified_content
            )

        # 3. Replace all references to the port in the module body
        # We need to be careful to only replace whole words
        body_pattern = r"\b" + re.escape(from_name) + r"\b"
        body_replacement = to_name
        modified_content = re.sub(body_pattern, body_replacement, modified_content)

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
    parser = argparse.ArgumentParser(description="Rename a port in a Verilog module")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--from", dest="from_name", required=True, help="Original port name"
    )
    parser.add_argument("--to", dest="to_name", required=True, help="New port name")

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_rename_port(
        args.input_file, args.output_file, args.from_name, args.to_name
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
