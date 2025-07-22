Here is a Python module that performs the task of changing reset condition from active-high to active-low or vice versa:
```python
import pyverilog.ast as ast
import re
import argparse

class ResetVisitor(ast.NodeVisitor):
    def __init__(self, direction):
        self.direction = direction
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, ast.IfStatement):
            for cond in node.cond:
                if isinstance(cond, ast.BinaryOp) and cond.op == 'eq' and cond.left.name == 'rst':
                    if self.direction == 'low':
                        cond.right.value = f'!{cond.right.value}'
                    else:
                        cond.right.value = f'{cond.right.value}'
                    self.changes_made.append(f"Changed reset condition to {self.direction}-high")
        for c in node.children():
            self.visit(c)

def transform_reset(input_file, output_file, direction):
    # Parse AST
    ast_node, directives = parse([input_file])

    # Apply visitor
    visitor = ResetVisitor(direction)
    visitor.visit(ast_node)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Update sensitivity lists (posedge to negedge)
    if direction == 'low':
        pattern = r'posedge \(rst\)'
        replacement = 'negedge (!rst)'
    else:
        pattern = r'negedge \(rst\)'
        replacement = 'posedge rst'

    modified_content = re.sub(pattern, replacement, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

def main():
    parser = argparse.ArgumentParser(description='Change reset condition from active-high to active-low or vice versa')
    parser.add_argument('input_file', help='Input Verilog file')
    parser.add_argument('output_file', help='Output Verilog file')
    parser.add_argument('-d', '--direction', choices=['high', 'low'], default='low', help='Direction of reset condition change (default: low)')
    args = parser.parse_args()

    if not transform_reset(args.input_file, args.output_file, args.direction):
        print("Transformation failed")

if __name__ == '__main__':
    main()
```
This module defines a `ResetVisitor` class that inherits from the existing xform framework pattern. The visitor class identifies target elements (in this case, `IfStatement` nodes) and applies changes to the reset condition.

The `transform_reset` function takes three arguments: input file, output file, and direction of reset condition change (either 'high' or 'low'). It parses the AST using PyVerilog, applies the visitor, performs regex transformations to update sensitivity lists, and writes the modified content to the output file.

The `main` function provides a command-line interface using argparse. It calls the `transform_reset` function with the input file, output file, and direction of reset condition change as arguments.

Note that this module assumes that the reset signal is named 'rst' in the Verilog code. If your code uses a different name for the reset signal, you'll need to modify the visitor class accordingly.