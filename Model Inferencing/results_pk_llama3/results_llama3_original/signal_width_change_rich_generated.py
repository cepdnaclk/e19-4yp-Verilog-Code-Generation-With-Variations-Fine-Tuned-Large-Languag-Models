Here is a Python module that performs the task of changing a signal's bit width specification:
```python
import pyverilog.ast as ast
import re
import argparse

class BitWidthTransformer(ast.ASTVisitor):
    def __init__(self, old_width, new_width):
        self.old_width = old_width
        self.new_width = new_width
        self.changes_made = []

    def visit(self, node):
        if isinstance(node, ast.Signal):
            if node.width == self.old_width:
                node.width = self.new_width
                self.changes_made.append(f"Updated {node.name} width from {self.old_width} to {self.new_width}")

def transform_bit_width(input_file, output_file, old_width, new_width):
    # Parse AST
    ast_node, directives = parse([input_file])

    # Apply visitor
    transformer = BitWidthTransformer(old_width, new_width)
    transformer.visit(ast_node)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = re.sub(rf"({old_width})\b", lambda m: str(new_width), content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

def main():
    parser = argparse.ArgumentParser(description="Change a signal's bit width specification")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("-o", "--old_width", type=int, required=True, help="Old bit width to replace")
    parser.add_argument("-n", "--new_width", type=int, required=True, help="New bit width to set")

    args = parser.parse_args()

    if not transform_bit_width(args.input_file, args.output_file, args.old_width, args.new_width):
        print("Transformation failed!")

if __name__ == "__main__":
    main()
```
Here's a breakdown of the code:

1. The `BitWidthTransformer` class inherits from `ast.ASTVisitor`, which allows us to traverse the Abstract Syntax Tree (AST) generated by PyVerilog.
2. In the constructor, we store the old and new widths as instance variables.
3. In the `visit` method, we iterate over the AST nodes and check if each node is a `Signal`. If it is, we check if its width matches the old width. If it does, we update the width to the new value and log the change in the `changes_made` list.
4. The `transform_bit_width` function takes the input file, output file, old width, and new width as arguments. It parses the AST, applies the visitor, performs regex transformations on the input file content, and writes the modified content to the output file.
5. In the `main` function, we use the `argparse` library to define a command-line interface that takes the input file, output file, old width, and new width as arguments. We then call the `transform_bit_width` function with these arguments.

To integrate this module with the existing xform framework patterns, you can modify the `xform` function in your framework to take an additional argument, say `bit_width_transformer`, which would be an instance of the `BitWidthTransformer` class. Then, you can call the `visit` method on this transformer before performing any other transformations.

Note that this code assumes that the signal declaration is in the format `signal [name] ([old_width]);`. If your signal declarations have a different format, you may need to modify the regex pattern used in the `transform_bit_width` function.