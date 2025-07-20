#!/usr/bin/env python3
"""
Transformation to modify a declaration to use different structure types.
This follows the pattern of the existing framework, using PyVerilog AST for analysis
and regex for the actual transformations.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class StructureTypeVisitor:
    """
    AST visitor that identifies array declarations to change to structure types.
    """

    def __init__(self, signal_name, struct_type):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            struct_type (str): Type of structure to use
        """
        self.signal_name = signal_name
        self.struct_type = struct_type
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

                        # Determine signal type - this will be replaced
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
                            "Changed '%s' to use structure type '%s'"
                            % (self.signal_name, self.struct_type)
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_structure_type(input_file, output_file, signal_name, struct_type):
    """
    Transform a signal declaration to use a specified structure type.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        struct_type (str): Type of structure to use

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
        visitor = StructureTypeVisitor(signal_name, struct_type)
        visitor.visit(ast)

        # Check if the signal was found
        if not visitor.signal_found:
            print("Warning: Signal '%s' not found" % signal_name)
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Get the extracted information from the visitor
        original_signal_type = visitor.signal_type
        original_width = visitor.original_width
        original_array_dim = visitor.original_array_dim

        # Create the structure type string based on the specified structure type
        if struct_type == "packed":
            struct_str = "struct packed {bit[7:0] x; bit[7:0] y;}"
        elif struct_type == "unpacked":
            struct_str = "struct {bit[7:0] x; bit[7:0] y;}"
        elif struct_type == "nested":
            struct_str = "struct packed {bit[7:0] a; struct packed {bit[3:0] b; bit[3:0] c;} inner;}"
        elif struct_type == "hybrid":
            struct_str = (
                "struct packed {bit[7:0] a; struct {bit[3:0] b; bit[3:0] c;} inner;}"
            )
        elif struct_type == "union":
            struct_str = "union packed {bit[15:0] a; bit[7:0][1:0] b;}"
        elif struct_type == "blasted":
            # This would typically require more complex transformations
            struct_str = (
                "// Blasted structure representation\nbit[7:0] %s_x;\nbit[7:0] %s_y;"
                % (signal_name, signal_name)
            )
            # For blasted structures, we might need a different approach
            # This is just a placeholder
        elif struct_type == "native":
            struct_str = (
                "native_struct_t"  # Assuming native_struct_t is defined elsewhere
            )
        elif struct_type == "extended_class":
            struct_str = "class BaseClass extends ParentClass {bit[7:0] value;}"
        elif struct_type == "rand_members":
            struct_str = "struct {rand bit[7:0] x; rand bit[7:0] y;}"
        else:
            # Default to a simple packed structure
            struct_str = "struct packed {bit[7:0] x; bit[7:0] y;}"

        # For blasted structure, we need a different approach
        if struct_type == "blasted":
            # Find where the original declaration ends
            if original_width and original_array_dim:
                pattern = r"%s\s+%s\s+%s\s+%s;" % (
                    original_signal_type,
                    re.escape(original_width),
                    re.escape(signal_name),
                    re.escape(original_array_dim),
                )
            elif original_width:
                pattern = r"%s\s+%s\s+%s;" % (
                    original_signal_type,
                    re.escape(original_width),
                    re.escape(signal_name),
                )
            else:
                pattern = r"%s\s+%s;" % (original_signal_type, re.escape(signal_name))

            # Replace with blasted structure declarations
            replacement = struct_str
            modified_content = re.sub(pattern, replacement, content)
        else:
            # Create the pattern for replacement based on what we have
            if original_width and original_array_dim:
                pattern = r"%s\s+%s\s+%s\s+%s;" % (
                    original_signal_type,
                    re.escape(original_width),
                    re.escape(signal_name),
                    re.escape(original_array_dim),
                )
                replacement = "%s %s %s;" % (
                    struct_str,
                    signal_name,
                    original_array_dim,
                )
            elif original_width:
                pattern = r"%s\s+%s\s+%s;" % (
                    original_signal_type,
                    re.escape(original_width),
                    re.escape(signal_name),
                )
                replacement = "%s %s;" % (struct_str, signal_name)
            else:
                pattern = r"%s\s+%s;" % (original_signal_type, re.escape(signal_name))
                replacement = "%s %s;" % (struct_str, signal_name)

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
        description="Transform a signal to use a specified structure type"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--struct-type",
        required=True,
        choices=[
            "packed",
            "unpacked",
            "nested",
            "hybrid",
            "union",
            "blasted",
            "native",
            "extended_class",
            "rand_members",
        ],
        help="Type of structure to use",
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print("Error: Input file '%s' not found" % args.input_file)
        return 1

    # Process the file
    success = transform_structure_type(
        args.input_file, args.output_file, args.signal, args.struct_type
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
