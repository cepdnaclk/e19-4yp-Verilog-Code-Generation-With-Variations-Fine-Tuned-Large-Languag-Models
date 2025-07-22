```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
import re


class MiscInsideVisitor(ast.NodeVisitor):
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

        return self.changes_made


def transform_misc_inside(input_file, output_file, signal_name):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = MiscInsideVisitor(signal_name)
    changes_made = visitor.visit(ast)

    # Perform regex transformations

    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = re.sub(
        r"(\b(?:\w+\.){0,2}inside\b)(?:\s*=\s*)(?P<value>\d+)",
        lambda m: f"{m.group(1)}= {signal_name}",
        content,
    )

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input file")
    parser.add_argument(
        "-o",
        "--output",
        default=None,
        help="Output file (default: input_file.xform)",
    )
    parser.add_argument("-s", "--signal_name", default="inside", help="Signal name")

    args = parser.parse_args()

    if not args.output:
        args.output = f"{args.input}.xform"

    transform_misc_inside(args.input, args.output, args.signal_name)
```