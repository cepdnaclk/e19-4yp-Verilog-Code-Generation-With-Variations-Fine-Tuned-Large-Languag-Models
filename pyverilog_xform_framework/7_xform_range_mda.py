"""
Transformation to modify a declaration to use fixed-range multi-dimensional arrays.
This uses PyVerilog AST for parsing and manipulation.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class FixedRangeMDAVisitor:
    """
    AST visitor that identifies array declarations to transform into MDAs.
    """

    def __init__(self, signal_name, ranges):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            ranges (list): List of range strings (e.g., ["7:0", "3:0", "15:0"])
        """
        self.signal_name = signal_name
        self.ranges = ranges
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        """Visit a node and identify signals to transform."""
        if isinstance(node, Node):
            # Process declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        # Found the signal
                        self.signal_found = True

                        # Check if it's an array
                        if hasattr(item, "length") and item.length:
                            # Create Width objects for each dimension
                            widths = []
                            for range_str in self.ranges:
                                msb_str, lsb_str = range_str.split(":")
                                msb = IntConst(msb_str)
                                lsb = IntConst(lsb_str)
                                widths.append(Width(msb, lsb))

                            # Replace the array length with MDA dimensions
                            # For simplicity, we'll just set the first dimension from the ranges
                            if len(widths) > 0:
                                item.length = widths[0]

                                # Record the change
                                self.changes_made.append(
                                    f"Changed '{self.signal_name}' to use fixed ranges: {self.ranges}"
                                )

                                # Note: In a real implementation using PyVerilog AST properly,
                                # we would need to modify the AST further to add additional dimensions
                                # This is a simplified approach

            # Continue visiting all child nodes
            for child in node.children():
                self.visit(child)


def transform_fixed_range_mda(input_file, output_file, signal_name, ranges):
    """
    Transform a signal declaration to use fixed-range multi-dimensional arrays.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        ranges (list): List of range strings (e.g., ["7:0", "3:0", "15:0"])

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor
        visitor = FixedRangeMDAVisitor(signal_name, ranges)
        visitor.visit(ast)

        # Check if signal was found
        if not visitor.signal_found:
            print(f"Warning: Signal '{signal_name}' not found")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Now apply the changes manually using regex, since PyVerilog's AST doesn't
        # directly support multi-dimensional array representation
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Create a pattern to find the array declaration
        # This pattern looks for the signal name with array dimensions
        pattern = rf"(reg|wire|logic|input|output|inout)\s+(\[\s*\d+\s*:\s*\d+\s*\])?\s+{re.escape(signal_name)}\s+(\[[^\]]+\]);"

        # Find the match
        match = re.search(pattern, content)
        if match:
            # Extract parts of the match
            signal_type = match.group(1)  # reg, wire, etc.
            width = match.group(2) or ""  # [7:0] or empty

            # Create the MDA dimensions string
            mda_dims = "".join([f"[{r}]" for r in ranges])

            # Create replacement string
            replacement = f"{signal_type} {width} {mda_dims} {signal_name};"

            # Replace the declaration
            modified_content = content.replace(match.group(0), replacement)

            # Write the modified content to the output file
            with open(output_file, "w") as f:
                f.write(modified_content)

            print(f"Output written to {output_file}")
            return True
        else:
            print(
                f"Warning: Could not locate array declaration pattern for '{signal_name}'"
            )
            return False

    except Exception as e:
        print(f"Error processing file: {e}")
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and process the file."""
    parser = argparse.ArgumentParser(
        description="Transform a signal to use fixed-range multi-dimensional arrays"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--ranges",
        required=True,
        nargs="+",
        help="List of ranges for dimensions (e.g., 7:0 3:0 15:0)",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_fixed_range_mda(
        args.input_file, args.output_file, args.signal, args.ranges
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
