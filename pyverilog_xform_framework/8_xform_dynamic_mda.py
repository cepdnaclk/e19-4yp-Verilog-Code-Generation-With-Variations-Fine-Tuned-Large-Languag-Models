#!/usr/bin/env python3
"""
Transformation to modify a declaration to use dynamic multi-dimensional arrays.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class DynamicMDAVisitor:
    """
    AST visitor that identifies array declarations to transform into dynamic MDAs.
    """

    def __init__(self, signal_name, dimensions):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            dimensions (int): Number of dimensions for the dynamic MDA
        """
        self.signal_name = signal_name
        self.dimensions = dimensions
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None  # 'reg', 'wire', 'logic', etc.
        self.original_width = None
        self.original_array_dim = None

    def visit(self, node):
        """Visit a node and identify signals to transform."""
        if isinstance(node, Node):
            # Check for array declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        # Found the signal
                        self.signal_found = True

                        # Determine signal type
                        self.signal_type = type(item).__name__.lower()

                        # Store original width if it exists
                        if hasattr(item, "width") and item.width:
                            if isinstance(item.width, Width):
                                msb = item.width.msb
                                lsb = item.width.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    self.original_width = "[%s:%s]" % (
                                        msb.value,
                                        lsb.value,
                                    )

                        # Store original array dimensions if they exist
                        if hasattr(item, "length") and item.length:
                            if isinstance(item.length, Length):
                                msb = item.length.msb
                                lsb = item.length.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    self.original_array_dim = "[%s:%s]" % (
                                        msb.value,
                                        lsb.value,
                                    )

                        self.changes_made.append(
                            "Changed '%s' to use %dD dynamic array"
                            % (self.signal_name, self.dimensions)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_dynamic_mda(input_file, output_file, signal_name, dimensions):
    """
    Transform a signal declaration to use dynamic multi-dimensional arrays.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        dimensions (int): Number of dimensions for the dynamic MDA

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor
        visitor = DynamicMDAVisitor(signal_name, dimensions)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print("Warning: Signal '%s' not found" % signal_name)
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        signal_type = visitor.signal_type
        original_width = visitor.original_width
        original_array_dim = visitor.original_array_dim

        # Create the dynamic MDA dimensions
        dynamic_dims = "[]" * int(dimensions)

        # Create the pattern for replacement
        if original_width and original_array_dim:
            pattern = r"%s\s+%s\s+%s\s+%s;" % (
                signal_type,
                re.escape(original_width),
                re.escape(signal_name),
                re.escape(original_array_dim),
            )
            replacement = "%s %s %s %s;" % (
                signal_type,
                original_width,
                dynamic_dims,
                signal_name,
            )
        elif original_width:
            pattern = r"%s\s+%s\s+%s\s+\[[^\]]+\];" % (
                signal_type,
                re.escape(original_width),
                re.escape(signal_name),
            )
            replacement = "%s %s %s %s;" % (
                signal_type,
                original_width,
                dynamic_dims,
                signal_name,
            )
        else:
            pattern = r"%s\s+%s\s+\[[^\]]+\];" % (signal_type, re.escape(signal_name))
            replacement = "%s %s %s;" % (signal_type, dynamic_dims, signal_name)

        # Perform the replacement
        modified_content = re.sub(pattern, replacement, content)

        # Write the modified content to the output file
        with open(output_file, "w") as f:
            f.write(modified_content)

        print("Output written to %s" % output_file)
        return True

    except Exception as e:
        print("Error processing file: %s" % e)
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and process the file."""
    parser = argparse.ArgumentParser(
        description="Transform a signal to use dynamic multi-dimensional arrays"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--dimensions",
        type=int,
        required=True,
        default=2,
        help="Number of dimensions for the dynamic MDA (default: 2)",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_dynamic_mda(
        args.input_file, args.output_file, args.signal, args.dimensions
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
