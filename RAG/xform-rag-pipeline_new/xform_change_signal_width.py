#!/usr/bin/env python3
"""
Transformation to change a signal's width in a Verilog module.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class SignalWidthVisitor:
    """
    AST visitor that identifies signals whose width needs to be changed.
    """

    def __init__(self, signal_name, new_width):
        self.signal_name = signal_name
        # Parse the new width as [msb:lsb]
        if isinstance(new_width, str) and ":" in new_width:
            msb, lsb = new_width.strip("[]").split(":")
            self.new_msb = msb.strip()
            self.new_lsb = lsb.strip()
        else:
            raise ValueError("New width must be in the format 'msb:lsb' (e.g., '3:0')")

        self.changes_made = []
        self.signals_found = []
        self.current_width = None

    def visit(self, node):
        """Visit a node and identify signals to modify."""
        if isinstance(node, Node):
            # Check various types of signals (ports, wires, regs, etc.)
            if (
                hasattr(node, "name")
                and node.name == self.signal_name
                and hasattr(node, "width")
                and node.width
            ):
                # Found the signal with a width
                if isinstance(node.width, Width):
                    msb = node.width.msb
                    lsb = node.width.lsb
                    if hasattr(msb, "value") and hasattr(lsb, "value"):
                        old_msb = msb.value
                        old_lsb = lsb.value
                        self.current_width = f"[{old_msb}:{old_lsb}]"

                        # Identify the node type (Input, Output, Reg, Wire, etc.)
                        node_type = type(node).__name__

                        self.signals_found.append(
                            {
                                "type": node_type.lower(),  # input, output, reg, wire, etc.
                                "old_width": self.current_width,
                                "new_width": f"[{self.new_msb}:{self.new_lsb}]",
                            }
                        )
                        self.changes_made.append(
                            f"Changed width of {node_type.lower()} '{self.signal_name}' "
                            f"from {self.current_width} to [{self.new_msb}:{self.new_lsb}]"
                        )

            # Continue visiting all child nodes
            for child in node.children():
                self.visit(child)


def transform_signal_width(input_file, output_file, signal_name, new_width):
    """
    Transform a signal's width.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        new_width (str): New width in the format 'msb:lsb' (e.g., '3:0')

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify signals to modify
        visitor = SignalWidthVisitor(signal_name, new_width)
        visitor.visit(ast)

        # Check if signals were found
        if not visitor.signals_found:
            print(f"Warning: Signal '{signal_name}' not found or has no width")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Perform the transformations using regex
        modified_content = content

        for signal in visitor.signals_found:
            # Escape special characters in the old width string for regex
            old_width_escaped = re.escape(signal["old_width"])

            # Create pattern based on signal type
            signal_type = signal["type"]
            if signal_type in ["input", "output", "inout"]:
                # For ports
                pattern = rf"\b{signal_type}\s+{old_width_escaped}\s+{signal_name}\b"
                replacement = f"{signal_type} {signal['new_width']} {signal_name}"
            else:
                # For other signals (reg, wire, etc.)
                pattern = rf"\b{signal_type}\s+{old_width_escaped}\s+{signal_name}\b"
                replacement = f"{signal_type} {signal['new_width']} {signal_name}"

            # Replace the width
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
    parser = argparse.ArgumentParser(
        description="Change a signal's width in a Verilog module"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--width", required=True, help='New width in the format "msb:lsb" (e.g., "3:0")'
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_signal_width(
        args.input_file, args.output_file, args.signal, args.width
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
