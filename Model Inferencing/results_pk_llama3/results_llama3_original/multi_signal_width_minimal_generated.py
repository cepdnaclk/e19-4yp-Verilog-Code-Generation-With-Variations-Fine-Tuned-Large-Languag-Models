Here is a Python module that performs the task of changing the bit width of multiple signals at once:
```python
import pyverilog
import re
import argparse

class BitWidthTransformer(pyverilog.visitor.Visitor):
    def __init__(self, signal_names, new_widths):
        self.signal_names = signal_names
        self.new_widths = new_widths

    def visit_declaration(self, node):
        if isinstance(node, pyverilog.ast.SignalDeclaration):
            for signal_name in self.signal_names:
                if signal_name == node.name:
                    # Update the bit width specification
                    node.width = self.new_widths[signal_name]
                    return True
        return False

    def visit_array_declaration(self, node):
        if isinstance(node, pyverilog.ast.ArrayDeclaration):
            for signal_name in self.signal_names:
                if signal_name == node.name:
                    # Update the bit width specification for packed arrays
                    node.width = self.new_widths[signal_name]
                    return True
        return False

    def visit_unpacked_array_declaration(self, node):
        if isinstance(node, pyverilog.ast.UnpackedArrayDeclaration):
            for signal_name in self.signal_names:
                if signal_name == node.name:
                    # Update the bit width specification for unpacked arrays
                    node.width = self.new_widths[signal_name]
                    return True
        return False

    def visit(self, node):
        if isinstance(node, pyverilog.ast.Module):
            for child in node.children:
                self.visit(child)
        return False


def transform_bit_width(vfile, signal_names, new_widths):
    """
    Transform the bit width of multiple signals at once.

    :param vfile: The Verilog file to transform
    :param signal_names: A list of signal names to update
    :param new_widths: A dictionary mapping signal names to new widths
    :return: True if successful, False otherwise
    """
    # Parse the Verilog file using PyVerilog
    ast = pyverilog.parse_file(vfile)

    # Create a visitor instance with the given signal names and new widths
    transformer = BitWidthTransformer(signal_names, new_widths)

    # Visit the AST to perform the transformations
    if not transformer.visit(ast):
        return False

    # Generate the transformed Verilog code
    transformed_code = pyverilog.generate_code(ast)

    # Write the transformed code back to a file
    with open(vfile + ".transformed", "w") as f:
        f.write(transformed_code)

    return True


def main():
    """
    Command-line interface for the bit width transformation.
    """
    parser = argparse.ArgumentParser(description="Transform the bit width of multiple signals at once.")
    parser.add_argument("vfile", help="The Verilog file to transform")
    parser.add_argument("-s", "--signal-names", nargs="+", help="A list of signal names to update")
    parser.add_argument("-w", "--new-widths", nargs="+", help="A dictionary mapping signal names to new widths (e.g. --new-widths foo=8 bar=16)")
    args = parser.parse_args()

    if not transform_bit_width(args.vfile, args.signal_names, {k: int(v) for k, v in zip(args.signal_names, args.new_widths)}):
        print("Transformation failed!")
    else:
        print("Transformation successful!")


if __name__ == "__main__":
    main()
```
Here's a breakdown of the code:

1. The `BitWidthTransformer` class inherits from PyVerilog's `Visitor` class and implements methods to visit different types of nodes in the AST.
2. The `visit_declaration`, `visit_array_declaration`, and `visit_unpacked_array_declaration` methods update the bit width specification for each signal declaration, array declaration, or unpacked array declaration that matches one of the given signal names.
3. The `transform_bit_width` function takes a Verilog file, a list of signal names to update, and a dictionary mapping signal names to new widths. It parses the Verilog file using PyVerilog, creates a visitor instance with the given signal names and new widths, visits the AST to perform the transformations, generates the transformed code, and writes it back to a file.
4. The `main` function provides a command-line interface for the transformation. It uses the `argparse` library to parse command-line arguments and calls the `transform_bit_width` function with the parsed arguments.

To use this module, simply run it from the command line:
```bash
$ python bit_width_transformer.py my_file.v --signal-names foo bar --new-widths foo=8 bar=16
```
This will transform the bit width of signals "foo" and "bar" in `my_file.v` to 8 and 16 bits, respectively. The transformed code will be written back to a file named `my_file.v.transformed`.