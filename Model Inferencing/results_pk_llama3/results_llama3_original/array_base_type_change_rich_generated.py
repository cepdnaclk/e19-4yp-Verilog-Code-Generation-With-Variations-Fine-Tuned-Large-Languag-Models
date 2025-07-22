Here is a Python module that performs the task of changing the base type of an array declaration in Verilog/SystemVerilog:

```python
import pyverilog.parser as verilog_parser
import re
import argparse

class ArrayTypeTransformer:
    def __init__(self, old_type, new_type):
        self.old_type = old_type
        self.new_type = new_type

    def visit(self, node):
        if isinstance(node, verilog_parser.ArrayDecl):
            if node.type.name == self.old_type:
                node.type.name = self.new_type
                for dim in node.dimensions:
                    if dim.width is not None and dim.width.value == '1':
                        dim.width.value = str(len(node.data))
                return True

        for c in node.children():
            self.visit(c)

def transform_array_types(input_file, output_file, old_type, new_type):
    # Parse AST
    ast, directives = verilog_parser.parse([input_file])

    # Apply visitor
    transformer = ArrayTypeTransformer(old_type, new_type)
    transformer.visit(ast)

    # Write output
    with open(output_file, "w") as f:
        f.write(str(ast))

    return True

def main():
    parser = argparse.ArgumentParser(description='Change the base type of an array declaration')
    parser.add_argument('input_file', help='Input Verilog file')
    parser.add_argument('output_file', help='Output Verilog file')
    parser.add_argument('--old-type', required=True, help='Old type to be replaced (e.g., bit)')
    parser.add_argument('--new-type', required=True, help='New type to replace with (e.g., logic)')

    args = parser.parse_args()

    if not transform_array_types(args.input_file, args.output_file, args.old_type, args.new_type):
        print("Transformation failed")

if __name__ == "__main__":
    main()
```

This module defines a `ArrayTypeTransformer` class that inherits from the existing xform pattern. The `visit` method of this class checks if the current node is an array declaration and if its type matches the old type to be replaced. If it does, the method updates the type to the new one and adjusts any width specifications accordingly.

The `transform_array_types` function parses the input Verilog file using PyVerilog, applies the visitor to the AST, and writes the transformed code to the output file.

The `main` function provides a command-line interface for the transformation. It uses the `argparse` library to parse the command-line arguments and calls the `transform_array_types` function with these arguments.

Note that this module does not perform any error handling or validation beyond checking if the input files exist. You may want to add additional checks to ensure that the transformation is successful and that the output file can be written without errors.