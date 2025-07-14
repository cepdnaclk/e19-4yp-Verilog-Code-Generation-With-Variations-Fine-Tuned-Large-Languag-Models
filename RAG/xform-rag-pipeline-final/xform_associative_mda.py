"""
Transformation to modify a declaration to use associative array multi-dimensional arrays.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class AssociativeMDAVisitor:
    """
    AST visitor that identifies array declarations to transform into associative MDAs.
    """

    def __init__(self, signal_name, key_type, dimensions=1):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            key_type (str): Type of key for associative array ('string', 'int', 'vector', 'wildcard', etc.)
            dimensions (int): Number of associative array dimensions
        """
        self.signal_name = signal_name
        self.key_type = key_type
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
                                    self.original_width = f"[{msb.value}:{lsb.value}]"

                        # Store original array dimensions if they exist
                        if hasattr(item, "length") and item.length:
                            if isinstance(item.length, Length):
                                msb = item.length.msb
                                lsb = item.length.lsb
                                if hasattr(msb, "value") and hasattr(lsb, "value"):
                                    self.original_array_dim = (
                                        f"[{msb.value}:{lsb.value}]"
                                    )

                        self.changes_made.append(
                            f"Changed '{self.signal_name}' to use {self.dimensions}D associative array with key type '{self.key_type}'"
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_associative_mda(
    input_file, output_file, signal_name, key_type, dimensions=1
):
    """
    Transform a signal declaration to use associative array multi-dimensional arrays.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        key_type (str): Type of key for associative array ('string', 'int', 'vector', 'class', 'wildcard')
        dimensions (int): Number of associative array dimensions

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
        visitor = AssociativeMDAVisitor(signal_name, key_type, dimensions)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print(f"Warning: Signal '{signal_name}' not found")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        signal_type = visitor.signal_type
        original_width = visitor.original_width
        original_array_dim = visitor.original_array_dim

        # Create the associative array syntax based on key type
        assoc_dims = ""
        for i in range(int(dimensions)):
            if key_type.lower() == "string":
                assoc_dims += "[string]"
            elif key_type.lower() == "int":
                assoc_dims += "[int]"
            elif key_type.lower() == "vector":
                # Use a common bit vector width
                assoc_dims += "[bit[31:0]]"
            elif key_type.lower() == "class":
                # For class type, we'll use a placeholder
                assoc_dims += "[SomeClass]"
            elif key_type.lower() == "wildcard":
                assoc_dims += "[*]"
            else:
                # Default to the specified key type
                assoc_dims += f"[{key_type}]"

        # Create the pattern for replacement
        if original_width and original_array_dim:
            pattern = rf"{signal_type}\s+{re.escape(original_width)}\s+{re.escape(signal_name)}\s+{re.escape(original_array_dim)};"
            replacement = f"{signal_type} {original_width} {assoc_dims} {signal_name};"
        elif original_width:
            pattern = rf"{signal_type}\s+{re.escape(original_width)}\s+{re.escape(signal_name)}\s+\[[^\]]+\];"
            replacement = f"{signal_type} {original_width} {assoc_dims} {signal_name};"
        else:
            pattern = rf"{signal_type}\s+{re.escape(signal_name)}\s+\[[^\]]+\];"
            replacement = f"{signal_type} {assoc_dims} {signal_name};"

        # Perform the replacement
        modified_content = re.sub(pattern, replacement, content)

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
        description="Transform a signal to use associative array multi-dimensional arrays"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--key-type",
        required=True,
        choices=["string", "int", "vector", "class", "wildcard"],
        help="Type of key for associative array",
    )
    parser.add_argument(
        "--dimensions",
        type=int,
        default=1,
        help="Number of associative array dimensions (default: 1)",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_associative_mda(
        args.input_file, args.output_file, args.signal, args.key_type, args.dimensions
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
