```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, compile
from argparse import ArgumentParser


class MDAVisitor(ast.NodeVisitor):
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, ast.Decl):
            for item in node.list:
                if hasattr(item, "name") and item.name == self.signal_name:
                    self.signal_found = True
                    self.changes_made.append(f"Found {self.signal_name}")

        # Visit children
        for c in node.children():
            self.visit(c)


def transform(input_file, output_file, signal_name):
    ast, directives = parse([input_file])

    visitor = MDAVisitor(signal_name)
    visitor.visit(ast)

    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = sub(
        compile(r"(\w+)\s*=\s*(\[\d+\])"),
        r"\1\s*=\s*\[[\d+]\]",
        content
    )

    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


def main():
    parser = ArgumentParser()
    parser.add_argument("input", help="Input file")
    parser.add_argument("output", help="Output file")
    parser.add_argument(
        "--signal",
        default=None,
        help="Signal name to search for"
    )
    args = parser.parse_args()

    if not transform(args.input, args.output, args.signal):
        print(f"Failed to transform {args.input}!")
        exit(1)

if __name__ == "__main__":
    main()
```