#!/usr/bin/env python3
"""
Framework for Verilog code transformations using PyVerilog.
This provides a base class for creating various transformations.
"""

import os
import sys
import argparse
from abc import ABC, abstractmethod
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class XformBase(ABC):
    """Base class for all transformations."""

    def __init__(self, name, description):
        """
        Initialize the transformation.

        Args:
            name (str): Name of the transformation
            description (str): Description of what the transformation does
        """
        self.name = name
        self.description = description
        self.changes_made = []

    @abstractmethod
    def visit(self, node):
        """
        Visit an AST node and apply the transformation.
        This must be implemented by all transformation subclasses.

        Args:
            node: The PyVerilog AST node to visit
        """
        pass

    def apply(self, ast):
        """
        Apply the transformation to the AST.

        Args:
            ast: The PyVerilog AST to transform

        Returns:
            list: List of changes made during the transformation
        """
        self.changes_made = []
        self.visit(ast)
        return self.changes_made

    def __str__(self):
        return f"{self.name}: {self.description}"


class XformRunner:
    """Runner for applying transformations to Verilog code."""

    @staticmethod
    def run_xform(xform, input_file, output_file, **kwargs):
        """
        Run a transformation on a Verilog file.

        Args:
            xform (XformBase): The transformation to apply
            input_file (str): Path to input Verilog file
            output_file (str): Path to output Verilog file
            **kwargs: Additional arguments for the transformation

        Returns:
            bool: True if successful, False otherwise
        """
        try:
            # Parse the Verilog file to get the AST
            ast, directives = parse([input_file])

            # Apply the transformation
            changes = xform.apply(ast)

            # Check if any changes were made
            if not changes:
                print(f"Warning: No changes made by {xform.name}")
                return False

            # Print summary of changes
            print(f"Applied transformation: {xform}")
            print(f"Made {len(changes)} changes:")
            for change in changes:
                print(f"  - {change}")

            # Generate the modified Verilog code
            with open(output_file, "w") as f:
                f.write(ast.show())

            print(f"Output written to {output_file}")
            return True

        except Exception as e:
            print(f"Error applying transformation {xform.name}: {e}")
            return False

    @staticmethod
    def run_xform_chain(xforms, input_file, output_file, **kwargs):
        """
        Run a chain of transformations on a Verilog file.

        Args:
            xforms (list): List of transformations to apply in sequence
            input_file (str): Path to input Verilog file
            output_file (str): Path to output Verilog file
            **kwargs: Additional arguments for the transformations

        Returns:
            bool: True if all transformations were successful, False otherwise
        """
        try:
            # Parse the Verilog file to get the AST
            ast, directives = parse([input_file])

            all_changes = []

            # Apply each transformation in sequence
            for xform in xforms:
                print(f"Applying transformation: {xform}")
                changes = xform.apply(ast)

                if changes:
                    all_changes.extend(changes)
                    print(f"  Made {len(changes)} changes")
                else:
                    print(f"  Warning: No changes made by {xform.name}")

            # Check if any changes were made
            if not all_changes:
                print("Warning: No changes made by any transformation")
                return False

            # Print summary of all changes
            print(f"Applied {len(xforms)} transformations")
            print(f"Made {len(all_changes)} changes in total")

            # Generate the modified Verilog code
            with open(output_file, "w") as f:
                f.write(ast.show())

            print(f"Output written to {output_file}")
            return True

        except Exception as e:
            print(f"Error applying transformation chain: {e}")
            return False


def main():
    """
    Main function for command-line usage.
    This is just a placeholder - the framework is meant to be imported and used
    with specific transformations.
    """
    print("This is a framework module and not meant to be run directly.")
    print("Please import it and use it with specific transformations.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
