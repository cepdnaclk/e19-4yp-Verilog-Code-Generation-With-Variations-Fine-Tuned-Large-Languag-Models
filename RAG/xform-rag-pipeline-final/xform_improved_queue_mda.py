"""
Transformation to modify a declaration to use queue-based multi-dimensional arrays.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class QueueMDAVisitor:
    """
    AST visitor that identifies array declarations to transform into queue MDAs.
    """

    def __init__(self, signal_name, dimensions, bounded=False, bound_size=None):
        """
        Initialize the visitor.

        Args:
            signal_name (str): Name of the signal to modify
            dimensions (int): Number of dimensions for the queue MDA
            bounded (bool): If True, create a bounded queue
            bound_size (int): Size bound for bounded queues, None for unbounded
        """
        self.signal_name = signal_name
        self.dimensions = dimensions
        self.bounded = bounded
        self.bound_size = bound_size
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

                        bound_str = (
                            f" with bound {self.bound_size}" if self.bounded else ""
                        )
                        self.changes_made.append(
                            f"Transformed '{self.signal_name}' to use {self.dimensions}D queue{bound_str}"
                        )

            # Visit children
            for c in node.children():
                self.visit(c)


def transform_queue_mda(
    input_file, output_file, signal_name, dimensions, bounded=False, bound_size=None
):
    """
    Transform a signal declaration to use queue-based multi-dimensional arrays.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        signal_name (str): Name of the signal to modify
        dimensions (int): Number of dimensions for the queue MDA
        bounded (bool): If True, create a bounded queue
        bound_size (int): Size bound for bounded queues, None for unbounded

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Try to parse the Verilog file
        try:
            ast, directives = parse([input_file])

            # Create and apply the visitor
            visitor = QueueMDAVisitor(signal_name, dimensions, bounded, bound_size)
            visitor.visit(ast)

            # Check if the signal was found
            if not visitor.signal_found:
                print(f"Warning: Signal '{signal_name}' not found in AST")
                # Fall back to direct string replacement
                return direct_replace(
                    content, output_file, signal_name, dimensions, bounded, bound_size
                )

            # Print summary of changes
            for change in visitor.changes_made:
                print(change)

            # Get the extracted information from the visitor
            signal_type = visitor.signal_type
            original_width = visitor.original_width
            original_array_dim = visitor.original_array_dim

            # Use the information for string replacement
            return direct_replace(
                content,
                output_file,
                signal_name,
                dimensions,
                bounded,
                bound_size,
                signal_type,
                original_width,
                original_array_dim,
            )

        except Exception as parse_err:
            print(f"PyVerilog parsing error: {parse_err}")
            print("Falling back to direct string replacement")
            return direct_replace(
                content, output_file, signal_name, dimensions, bounded, bound_size
            )

    except Exception as e:
        print(f"Error processing file: {e}")
        import traceback

        traceback.print_exc()
        return False


def direct_replace(
    content,
    output_file,
    signal_name,
    dimensions,
    bounded=False,
    bound_size=None,
    signal_type=None,
    original_width=None,
    original_array_dim=None,
):
    """Directly replace the array declaration using regex."""
    try:
        # If we don't have signal_type from AST, try to determine from content
        if not signal_type or not original_width or not original_array_dim:
            # Pattern to find array declarations
            pattern = rf"(reg|wire|logic|input|output|inout)\s+(\[\s*\d+\s*:\s*\d+\s*\])?\s+{re.escape(signal_name)}\s+(\[[^\]]+\]);"
            match = re.search(pattern, content)

            if not match:
                print(f"Warning: Could not find array declaration for '{signal_name}'")
                return False

            signal_type = match.group(1)
            original_width = match.group(2) or ""
            original_array_dim = match.group(3)

        # Create the queue MDA dimensions
        queue_dims = ""
        for i in range(int(dimensions)):
            if bounded and i == 0:  # Apply bound only to the first dimension
                queue_dims += f"[$:{bound_size}]"
            else:
                queue_dims += "[$]"

        # Create the pattern for replacement
        if original_width and original_array_dim:
            pattern = rf"{signal_type}\s+{re.escape(original_width)}\s+{re.escape(signal_name)}\s+{re.escape(original_array_dim)};"
            replacement = f"{signal_type} {original_width} {queue_dims} {signal_name};"
        elif original_width:
            pattern = rf"{signal_type}\s+{re.escape(original_width)}\s+{re.escape(signal_name)}\s+\[[^\]]+\];"
            replacement = f"{signal_type} {original_width} {queue_dims} {signal_name};"
        else:
            pattern = rf"{signal_type}\s+{re.escape(signal_name)}\s+\[[^\]]+\];"
            replacement = f"{signal_type} {queue_dims} {signal_name};"

        # Perform the replacement
        modified_content = re.sub(pattern, replacement, content)

        # Write the modified content to the output file
        with open(output_file, "w") as f:
            f.write(modified_content)

        bound_str = f" with bound {bound_size}" if bounded else ""
        print(f"Transformed '{signal_name}' to use {dimensions}D queue{bound_str}")
        print(f"Output written to {output_file}")
        return True

    except Exception as e:
        print(f"Error in direct replacement: {e}")
        import traceback

        traceback.print_exc()
        return False


def main():
    """Main function to parse command line arguments and process the file."""
    parser = argparse.ArgumentParser(
        description="Transform a signal to use queue-based multi-dimensional arrays"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", required=True, help="Name of the signal to modify")
    parser.add_argument(
        "--dimensions",
        type=int,
        required=True,
        default=1,
        help="Number of dimensions for the queue MDA (default: 1)",
    )
    parser.add_argument("--bounded", action="store_true", help="Create a bounded queue")
    parser.add_argument("--bound-size", type=int, help="Size limit for bounded queue")

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_queue_mda(
        args.input_file,
        args.output_file,
        args.signal,
        args.dimensions,
        args.bounded,
        args.bound_size,
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
