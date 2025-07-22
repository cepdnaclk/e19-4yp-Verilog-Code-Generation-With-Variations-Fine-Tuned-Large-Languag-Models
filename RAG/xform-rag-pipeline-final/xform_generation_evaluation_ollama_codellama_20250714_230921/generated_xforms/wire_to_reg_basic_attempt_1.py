#!/usr/bin/env python3
"""
Generated Xform: wire_to_reg_basic
Task: Transform wire declarations to reg declarations
Attempt: 1
Generated: 2025-07-14T23:09:44.051776
"""

#!/usr/bin/env python3
"""
Transform wire declarations to reg declarations
"""
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_wire_to_reg(input_file, output_file):
    """
    Transform wire declarations to reg declarations.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file

    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Read the input file
        with open(input_file, "r") as f:
            content = f.read()

        # Parse the Verilog file to get the AST
        ast, directives = parse([input_file])

        # Create and apply the visitor to identify wire declarations
        visitor = WireToRegVisitor()
        visitor.visit(ast)

        # Check if any changes were identified
        if not visitor.changes_made:
            print("Warning: No 'wire' variables found in file")
            return False

        # Print summary of changes
        for change in visitor.changes_made:
            print(change)

        # Replace wire declarations with reg in the content
        modified_content = content
        for decl in visitor.wire_declarations:
            # Match wire declaration with the correct width
            pattern = (
                r"\bwire\s+"
                + re.escape(decl["width"])
                + r"\b"
                + re.escape(decl["name"])
                + r"\b"
            )
            replacement = f'reg {decl["width"]}{decl["name"]}'
            modified_content = re.sub(pattern, replacement, modified_content)

        # Write the modified content to the output file
        with open(output_file, "w") as f:
            f.write(modified_content)

        print(f"Output written to {output_file}")
        return True
    except Exception as e:
        print("Error:", str(e))
        return False

class WireToRegVisitor(NodeVisitor):
    """
    AST visitor that identifies wire declarations to transform to reg.
    """

    def __init__(self):
        self.changes_made = []
        self.wire_declarations = []

    def visit_Decl(self, node):
        if isinstance(node, Decl):
            for item in node.list:
                if isinstance(item, Wire):
                    # Store information about the wire declaration
                    width = ""
                    if item.width:
                        msb = item.width.msb.value
                        lsb = item.width.lsb.value
                        width = f"[{msb}:{lsb}] "

                    self.wire_declarations.append(
                        {"name": item.name, "width": width}
                    )
                    self.changes_made.append(
                        f"Changed '{item.name}' from 'wire' to 'reg'"
                    )

# Dictionary of all available transformations
AVAILABLE_XFORMS = {
    "wire_to_reg": {
        "description": "Change wire declarations to reg declarations",
        "function": transform_wire_to_reg,
        "args": {},
    },
}