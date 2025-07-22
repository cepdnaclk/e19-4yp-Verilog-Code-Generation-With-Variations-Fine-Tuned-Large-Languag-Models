#!/usr/bin/env python3
"""
Generated Xform: wire_to_reg_basic
Task: Transform wire declarations to reg declarations
Attempt: 4
Generated: 2025-07-14T23:15:18.291020
"""

#!/usr/bin/env python3
"""
Transformation to change wire declarations to reg declarations using PyVerilog AST parsing and regex-based modifications.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_wire_to_reg(input_file, output_file, target_variable=None):
    """
    Transform wire declarations to reg declarations.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        target_variable (str, optional): If provided, only transform this variable

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
        visitor = WireToRegVisitor(target_variable)
        visitor.visit(ast)

        # Check if any changes were identified
        if not visitor.changes_made:
            if target_variable:
                print(
                    f"Warning: Variable '{target_variable}' not found or not declared as 'wire'"
                )
            else:
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

class WireToRegVisitor(ASTVisitor):
    """
    AST visitor that identifies wire declarations to transform to reg.
    """

    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = []
        self.wire_declarations = []

    def visit(self, node):
        """Visit a node and identify wire declarations."""
        if isinstance(node, Node):
            if isinstance(node, Decl):
                for item in node.list:
                    if isinstance(item, Wire):
                        # If targeting a specific variable, check the name
                        if self.target_variable is None or (
                            hasattr(item, "name") and item.name == self.target_variable
                        ):

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

            # Visit children
            for c in node.children():
                self.visit(c)

# Dictionary of all available transformations
AVAILABLE_XFORMS = {
    "wire_to_reg": {
        "description": "Change wire declarations to reg declarations",
        "function": transform_wire_to_reg,
        "args": {
            "target_variable": {
                "help": "Specific variable to transform (default: all wire variables)",
                "required": False,
                "arg_name": "variable",
            }
        },
    },
    "module_name": {
        "description": "Change module name",
        "function": transform_module_name,
        "args": {
            "from_name": {
                "help": "Original module name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New module name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "port_rename": {
        "description": "Rename ports in a module",
        "function": transform_rename_port,
        "args": {
            "from_name": {
                "help": "Original port name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New port name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "reset_condition": {
        "description": "Transform reset condition from active-high to active-low or vice versa",
        "function": transform_reset_condition,
        "args": {
            "reset_signal": {
                "help": "Name of the reset signal",
                "required": True,
                "arg_name": "signal",
            },
            "active_high_to_low": {
                "help": "Direction of change: high_to_low or low_to_high",
                "required": False,
                "arg_name": "direction",
            },
        },
    },
    "signal_width": {

#!/usr/bin/env python3
"""
Transformation to change wire declarations to reg declarations using PyVerilog AST parsing and regex-based modifications.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_wire_to_reg(input_file, output_file, target_variable=None):
    """
    Transform wire declarations to reg declarations.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        target_variable (str, optional): If provided, only transform this variable

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
        visitor = WireToRegVisitor(target_variable)
        visitor.visit(ast)

        # Check if any changes were identified
        if not visitor.changes_made:
            if target_variable:
                print(
                    f"Warning: Variable '{target_variable}' not found or not declared as 'wire'"
                )
            else:
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

class WireToRegVisitor(ASTVisitor):
    """
    AST visitor that identifies wire declarations to transform to reg.
    """

    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = []
        self.wire_declarations = []

    def visit(self, node):
        """Visit a node and identify wire declarations."""
        if isinstance(node, Node):
            if isinstance(node, Decl):
                for item in node.list:
                    if isinstance(item, Wire):
                        # If targeting a specific variable, check the name
                        if self.target_variable is None or (
                            hasattr(item, "name") and item.name == self.target_variable
                        ):

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

            # Visit children
            for c in node.children():
                self.visit(c)

# Dictionary of all available transformations
AVAILABLE_XFORMS = {
    "wire_to_reg": {
        "description": "Change wire declarations to reg declarations",
        "function": transform_wire_to_reg,
        "args": {
            "target_variable": {
                "help": "Specific variable to transform (default: all wire variables)",
                "required": False,
                "arg_name": "variable",
            }
        },
    },
    "module_name": {
        "description": "Change module name",
        "function": transform_module_name,
        "args": {
            "from_name": {
                "help": "Original module name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New module name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "port_rename": {
        "description": "Rename ports in a module",
        "function": transform_port_rename,
        "args": {
            "from_name": {
                "help": "Original port name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New port name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "reset_condition": {
        "description": "Transform reset condition from active-high to active-low or vice versa",
        "function": transform_reset_condition,
        "args": {
            "reset_signal": {
                "help": "Name of the reset signal",
                "required": True,
                "arg_name": "signal",
            },
            "active_high_to_low": {
                "help": "Direction of change: high_to_low or low_to_high",
                "required": False,
                "arg_name": "direction",
            },
        },
    },
    "signal_width": {

#!/usr/bin/env python3
"""
Transformation to change wire declarations to reg declarations using PyVerilog AST parsing and regex-based modifications.
"""

import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_wire_to_reg(input_file, output_file, target_variable=None):
    """
    Transform wire declarations to reg declarations.

    Args:
        input_file (str): Path to input Verilog file
        output_file (str): Path to output Verilog file
        target_variable (str, optional): If provided, only transform this variable

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
        visitor = WireToRegVisitor(target_variable)
        visitor.visit(ast)

        # Check if any changes were identified
        if not visitor.changes_made:
            if target_variable:
                print(
                    f"Warning: Variable '{target_variable}' not found or not declared as 'wire'"
                )
            else:
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

class WireToRegVisitor(ASTVisitor):
    """
    AST visitor that identifies wire declarations to transform to reg.
    """

    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = []
        self.wire_declarations = []

    def visit(self, node):
        """Visit a node and identify wire declarations."""
        if isinstance(node, Node):
            if isinstance(node, Decl):
                for item in node.list:
                    if isinstance(item, Wire):
                        # If targeting a specific variable, check the name
                        if self.target_variable is None or (
                            hasattr(item, "name") and item.name == self.target_variable
                        ):

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

            # Visit children
            for c in node.children():
                self.visit(c)

# Dictionary of all available transformations
AVAILABLE_XFORMS = {
    "wire_to_reg": {
        "description": "Change wire declarations to reg declarations",
        "function": transform_wire_to_reg,
        "args": {
            "target_variable": {
                "help": "Specific variable to transform (default: all wire variables)",
                "required": False,
                "arg_name": "variable",
            }
        },
    },
    "module_name": {
        "description": "Change module name",
        "function": transform_module_name,
        "args": {
            "from_name": {
                "help": "Original module name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New module name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "port_rename": {
        "description": "Rename ports in a module",
        "function": transform_port_rename,
        "args": {
            "from_name": {
                "help": "Original port name",
                "required": True,
                "arg_name": "from",
            },
            "to_name": {
                "help": "New port name",
                "required": True,
                "arg_name": "to",
            },
        },
    },
    "reset_condition": {
        "description": "Transform reset condition from active-high to active-low or vice versa",
        "function": transform_reset_condition,
        "args": {
            "reset_signal": {
                "help": "Name of the reset signal",
                "required": True,
                "arg_name": "signal",
            },
            "active_high_to_low": {
                "help": "Direction of change: high_to_low or low_to_high",
                "required": False,
                "arg_name": "direction",
            },
        },
    },
}