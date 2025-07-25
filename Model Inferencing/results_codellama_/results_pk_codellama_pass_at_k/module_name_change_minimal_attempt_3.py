# Generated by Ollama Llama 3
# Task: module_name_change_minimal
# Attempt: 3
# Success: False
# Overall Score: 0.515

```python
# -*- coding: utf-8 -*-
"""
This module provides a transformation to change the name of a module throughout the file.
It uses PyVerilog, regex, and argparse to perform the actual text transformations.
"""
import re
from pyverilog import vparser, vtypes
from xform.common import XFormBase
from xform.core import Transformation, XFormError


class RenameModule(Transformation):
    """
    A transformation that changes the name of a module throughout the file.
    """
    def __init__(self, args):
        super().__init__(args)

        # Parse arguments
        self.old_name = args.old_name
        self.new_name = args.new_name

        # Initialize PyVerilog parser and AST
        self._parser = vparser.VParser()
        self._ast = None

    @property
    def name(self):
        return f"RenameModule({self.old_name} -> {self.new_name})"

    def validate(self):
        """Validate that the arguments are correct."""
        if not self.old_name or not self.new_name:
            raise XFormError("Old and new names must be specified.")

    def visit(self, node):
        """Visit a node in the AST and perform the transformation."""
        # Check if we are dealing with a module declaration
        if isinstance(node, vtypes.ModuleDecl):
            # If the name matches the old name, replace it with the new name
            if self.old_name == node.name:
                return vtypes.ModuleDecl(self.new_name, node.ports)

        # Otherwise, just return the original node unchanged
        return node

    def transform(self, text):
        """Perform the transformation on the input text."""
        # Parse the text using PyVerilog parser
        self._ast = self._parser.parse(text)

        # Visit each node in the AST and perform the transformation
        self._ast = vtypes.Visitor().visit(self, self._ast)

        # Generate the transformed text
        return str(self._ast)

    def main(args):
        """Main function for command-line interface."""
        args.old_name = "old"
        args.new_name = "new"

        # Initialize transformation and validate arguments
        xform = RenameModule(args)
        xform.validate()

        # Read input file
        with open(args.input, "r") as f:
            text = f.read()

        # Perform the transformation
        transformed_text = xform.transform(text)

        # Write output to file
        with open(args.output, "w") as f:
            f.write(transformed_text)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", required=True, help="Input file path")
    parser.add_argument("-o", "--output", required=True, help="Output file path")
    parser.add_argument("-on", "--old-name", required=False, default="old", help="Old module name")
    parser.add_argument("-nn", "--new-name", required=False, default="new", help="New module name")
    args = parser.parse_args()
    RenameModule(args).main()
```