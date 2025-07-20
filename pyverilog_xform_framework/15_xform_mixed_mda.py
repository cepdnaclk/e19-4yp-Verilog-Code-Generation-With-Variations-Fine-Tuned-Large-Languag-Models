"""
Transformation to modify a declaration to use mixed multi-dimensional arrays.
Combines different MDA types in a single declaration (fixed, dynamic, associative, queue).
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class MixedMDAVisitor:
    """
    AST visitor that identifies array declarations to transform into mixed MDAs.
    """

    def __init__(self, signal_name, mda_spec):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            mda_spec (list): List of MDA dimension specs (e.g., ['fixed:7:0', 'assoc:string', 'queue'])
        """
        self.signal_name = signal_name
        self.mda_spec = mda_spec
        self.changes_made = []
        self.signal_found = False
        self.signal_type = None  # 'reg', 'wire', 'logic', etc.
        self.original_width = None

    def visit(self, node):
        """Visit a node and identify signals to transform."""
        if isinstance(node, Node):
            # Check various types of signals (ports, wires, regs, etc.)
            if hasattr(node, "name") and node.name == self.signal_name:
                # Found the signal
                self.signal_found = True

                # Determine signal type
                if isinstance(node, Reg):
                    self.signal_type = "reg"
                elif isinstance(node, Wire):
                    self.signal_type = "wire"
                elif isinstance(node, Input):
                    self.signal_type = "input"
                elif isinstance(node, Output):
                    self.signal_type = "output"
                elif isinstance(node, Inout):
                    self.signal_type = "inout"
                else:
                    self.signal_type = type(node).__name__.lower()

                # Store original width
                if hasattr(node, "width") and node.width:
                    if isinstance(node.width, Width):
                        msb = node.width.msb
                        lsb = node.width.lsb
                        if hasattr(msb, "value") and hasattr(lsb, "value"):
                            self.original_width = f"[{msb.value}:{lsb.value}]"

                # Add to changes list
                self.changes_made.append(
                    f"Changed '{self.signal_name}' to a mixed MDA with spec: {self.mda_spec}"
                )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_mixed_mda(input_file, output_file, signal_name, mda_spec):
    """
    Transform a signal declaration to use mixed multi-dimensional arrays.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        mda_spec (list): List of MDA dimension specs (e.g., ['fixed:7:0', 'assoc:string', 'queue'])

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
        visitor = MixedMDAVisitor(signal_name, mda_spec)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print(f"Warning: Signal '{signal_name}' not found")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Perform the transformations using regex
        modified_content = content
        signal_type = visitor.signal_type
        original_width = visitor.original_width or ""

        # Create the mixed MDA dimensions string
        mixed_dims = ""
        for spec in mda_spec:
            parts = spec.split(":")
            dim_type = parts[0].lower()

            if dim_type == "fixed":
                # Format: fixed:msb:lsb
                if len(parts) >= 3:
                    mixed_dims += f"[{parts[1]}:{parts[2]}]"
                else:
                    # Default range if not specified
                    mixed_dims += "[7:0]"

            elif dim_type == "dynamic":
                # Dynamic array - no size specification
                mixed_dims += "[]"

            elif dim_type == "queue":
                # Queue, optionally bounded
                if len(parts) >= 2:
                    # Bounded queue with size
                    mixed_dims += f"[$:{parts[1]}]"
                else:
                    # Unbounded queue
                    mixed_dims += "[$]"

            elif dim_type == "assoc" or dim_type == "associative":
                # Associative array with key type
                if len(parts) >= 2:
                    key_type = parts[1]
                    if key_type == "wildcard":
                        mixed_dims += "[*]"
                    elif key_type == "vector":
                        mixed_dims += "[bit[31:0]]"  # Example vector type
                    else:
                        mixed_dims += f"[{key_type}]"
                else:
                    # Default to int type if not specified
                    mixed_dims += "[int]"

            else:
                # Unknown type, just use as-is
                mixed_dims += f"[{dim_type}]"

        # Replace in declarations based on signal type and original width
        if signal_type and original_width:
            # For signals with width declaration
            pattern = (
                r"\b"
                + signal_type
                + r"\s+"
                + re.escape(original_width)
                + r"\s+"
                + re.escape(signal_name)
                + r"\b"
            )
            replacement = f"{signal_type} {original_width} {mixed_dims} {signal_name}"
            modified_content = re.sub(pattern, replacement, modified_content)
        elif signal_type:
            # For signals without width declaration
            pattern = r"\b" + signal_type + r"\s+" + re.escape(signal_name) + r"\b"
            replacement = f"{signal_type} {mixed_dims} {signal_name}"
            modified_content = re.sub(pattern, replacement, modified_content)

        # Also handle array declarations if any
        array_pattern = (
            r"\b"
            + signal_type
            + r"\s+"
            + re.escape(original_width)
            + r"\s+"
            + re.escape(signal_name)
            + r"\s*\[[^\]]+\]"
        )
        array_replacement = f"{signal_type} {original_width} {mixed_dims} {signal_name}"
        modified_content = re.sub(array_pattern, array_replacement, modified_content)

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
        description="Transform a signal to use mixed multi-dimensional arrays"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--mda-spec",
        required=True,
        nargs="+",
        help="MDA dimension specs (e.g., fixed:7:0 assoc:string queue)",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_mixed_mda(
        args.input_file, args.output_file, args.signal, args.mda_spec
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
