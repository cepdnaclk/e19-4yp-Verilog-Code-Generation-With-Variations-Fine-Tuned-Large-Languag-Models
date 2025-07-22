```
import pyverilog
import re
from argparse import ArgumentParser
from xform.core import Transformation, Visitor

class ChangeBitWidth(Transformation):
    """Change a signal's bit width specification"""

    def __init__(self, args):
        super().__init__(args)
        self.old_width = args.old_width
        self.new_width = args.new_width

    def visit(self, node):
        if isinstance(node, pyverilog.vparse.SignalDeclaration):
            # Check if the signal declaration has the old width
            if node.width == self.old_width:
                # Replace the width specification with the new width
                node.width = self.new_width
                return True
        return False

    def transform(self, ast):
        """Perform the transformation on the AST"""
        visitor = ChangeBitWidthVisitor(self)
        visitor.visit(ast)
        return ast

class ChangeBitWidthVisitor(Visitor):
    """Visitor class to identify target elements and perform text transformations"""

    def __init__(self, transformation):
        super().__init__()
        self.transformation = transformation

    def visit_SignalDeclaration(self, node):
        # Check if the signal declaration has the old width
        if node.width == self.transformation.old_width:
            # Replace the width specification with the new width
            node.width = self.transformation.new_width
            return True
        return False

def main():
    """Command-line interface for the transformation"""
    parser = ArgumentParser()
    parser.add_argument("--old_width", type=int, required=True, help="The old width of the signal")
    parser.add_argument("--new_width", type=int, required=True, help="The new width of the signal")
    args = parser.parse_args()

    # Create a ChangeBitWidth transformation instance with the command-line arguments
    change_bit_width = ChangeBitWidth(args)

    # Read the Verilog file and perform the transformation
    with open("input.v", "r") as f:
        ast = pyverilog.vparse.ParseFile(f, filename="input.v")
        transformed_ast = change_bit_width.transform(ast)

    # Write the transformed Verilog file to disk
    with open("output.v", "w") as f:
        transformed_ast.write(f)

if __name__ == "__main__":
    main()
```
This code defines a `ChangeBitWidth` transformation class that inherits from the `Transformation` class in the xform framework. The `__init__` method takes command-line arguments for the old and new widths of the signal, and the `visit` method checks if the current node is a signal declaration with the old width and replaces it with the new width if so.

The `ChangeBitWidthVisitor` class inherits from the `Visitor` class in the xform framework and overrides the `visit_SignalDeclaration` method to check if the current node is a signal declaration with the old width and replace it with the new width if so.

The `main` function defines a command-line interface for the transformation, which reads the Verilog file, performs the transformation using the `ChangeBitWidth` instance created from the command-line arguments, and writes the transformed Verilog file to disk.

Note that this code assumes that the input Verilog file is named "input.v" and the output Verilog file is named "output.v". You may need to modify these filenames depending on your specific use case.