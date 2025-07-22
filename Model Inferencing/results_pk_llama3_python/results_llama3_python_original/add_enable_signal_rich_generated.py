```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
import argparse


class AddEnableVisitor(ast.NodeVisitor):
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, ast.Node):
            # Check for target declarations
            if isinstance(node, ast.Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        self.signal_found = True
                        self.changes_made.append(f"Found {self.signal_name}")

            # Visit children
            for c in node.children():
                self.visit(c)

def transform_add_enable(input_file, output_file, signal_name):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = AddEnableVisitor(signal_name)
    visitor.visit(ast)

    if not visitor.signal_found:
        print(f"Error: {signal_name} not found in input file")
        return False

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = sub(r'(\s*)(\+)=\1(1)', r'\1+\1\2\3', content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input Verilog file")
    parser.add_argument("output", help="Output Verilog file")
    parser.add_argument("signal_name", help="Signal name to add enable")

    args = parser.parse_args()

    if not transform_add_enable(args.input, args.output, args.signal_name):
        print(f"Error: Failed to apply transformation")
```