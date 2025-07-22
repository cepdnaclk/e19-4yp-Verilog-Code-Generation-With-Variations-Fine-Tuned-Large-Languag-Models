#!/usr/bin/env python3
"""
Transformation to add an enable signal to a counter in a Verilog module.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class FindCounterVisitor:
    """
    AST visitor that identifies counter increment statements.
    """

    def __init__(self, counter_name):
        self.counter_name = counter_name
        self.changes_made = []
        self.counter_increments = []
        self.module_name = None
        self.ports = []

    def visit(self, node):
        """Visit a node and identify counter increments."""
        if isinstance(node, Node):
            # Get the module name
            if isinstance(node, ModuleDef):
                self.module_name = node.name
                # Collect ports to check if enable signal already exists
                for item in node.portlist.ports:
                    if isinstance(item, Ioport) and hasattr(item.first, "name"):
                        self.ports.append(item.first.name)

            # Find counter increments (x <= x + 1)
            if isinstance(node, NonblockingSubstitution):
                # Check if left side is the counter
                lhs = node.left
                if isinstance(lhs, Identifier) and lhs.name == self.counter_name:
                    # Check if right side is counter + 1
                    rhs = node.right
                    if (
                        isinstance(rhs, Plus)
                        and isinstance(rhs.left, Identifier)
                        and rhs.left.name == self.counter_name
                    ):
                        if isinstance(rhs.right, IntConst) and rhs.right.value == "1":
                            # Found a counter increment
                            # Store information about its context
                            parent_if = self._find_parent_if(node)

                            self.counter_increments.append(
                                {
                                    "statement": node,
                                    "parent_if": parent_if,
                                    "line": (
                                        node.lineno if hasattr(node, "lineno") else None
                                    ),
                                }
                            )
                            self.changes_made.append(
                                f"Added enable condition to '{self.counter_name}' increment"
                            )

            # Continue visiting all child nodes
            for child in node.children():
                self.visit(child)

    def _find_parent_if(self, node):
        """Attempt to find the parent if statement of a node."""
        # This is a simplified approach - in a real implementation,
        # we would need to track the parent-child relationships as we traverse
        # For now, we'll return None to indicate we don't have this information
        return None


def transform_add_enable(input_file, output_file, enable_name, counter_name):
    """
    Add an enable signal to a counter.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        enable_name (str): Name of the enable signal to add
        counter_name (str): Name of the counter to control

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify counter increments
        visitor = FindCounterVisitor(counter_name)
        visitor.visit(ast)

        # Check if counter increments were found
        if not visitor.counter_increments:
            print(f"Warning: No increments found for counter '{counter_name}'")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Perform the transformations
        modified_content = content

        # 1. Add the enable signal as a new input port if it doesn't exist
        if enable_name not in visitor.ports:
            # Find the module declaration
            module_pattern = r"module\s+(\w+)\s*\(([\s\S]*?)\);"

            def add_enable_port(match):
                module_name = match.group(1)
                port_list = match.group(2).strip()

                # Add the enable signal to the port list
                if port_list:
                    # Add to existing ports
                    new_port_list = port_list + f",\n    {enable_name}"
                else:
                    # Empty port list
                    new_port_list = enable_name

                return f"module {module_name}({new_port_list});"

            modified_content = re.sub(module_pattern, add_enable_port, modified_content)

            # Add input declaration for the enable signal
            # Find the last input declaration
            input_pattern = r"(input\s+[^;]*;)"
            last_input = None
            for match in re.finditer(input_pattern, modified_content):
                last_input = match

            if last_input:
                # Insert after the last input declaration
                pos = last_input.end()
                modified_content = (
                    modified_content[:pos]
                    + f"\n  input {enable_name};"
                    + modified_content[pos:]
                )
            else:
                # If no input declarations found, add after module declaration
                module_end_pattern = r"module\s+\w+\s*\([^;]*\);"
                module_match = re.search(module_end_pattern, modified_content)
                if module_match:
                    pos = module_match.end()
                    modified_content = (
                        modified_content[:pos]
                        + f"\n  input {enable_name};"
                        + modified_content[pos:]
                    )

        # 2. Modify counter increment statements to check the enable signal
        # First, identify all statements like "counter <= counter + 1;"
        counter_incr_pattern = rf"({counter_name}\s*<=\s*{counter_name}\s*\+\s*1\s*;)"

        # Function to replace with enable condition
        def add_enable_condition(match):
            incr_stmt = match.group(1)
            return f"if ({enable_name}) begin\n      {incr_stmt}\n    end"

        # Replace counter increments
        modified_content = re.sub(
            counter_incr_pattern, add_enable_condition, modified_content
        )

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
        description="Add an enable signal to a counter in a Verilog module"
    )
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument(
        "--enable", required=True, help="Name of the enable signal to add"
    )
    parser.add_argument(
        "--counter", required=True, help="Name of the counter to control"
    )

    args = parser.parse_args()

    # Ensure input file exists
    if not os.path.exists(args.input_file):
        print(f"Error: Input file '{args.input_file}' not found")
        return 1

    # Process the file
    success = transform_add_enable(
        args.input_file, args.output_file, args.enable, args.counter
    )

    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
