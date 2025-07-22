```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import find_node
from re import sub, compile


def transform_bitwidth(input_file, output_file, signal_names, new_width):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = BitWidthVisitor(signal_names, new_width)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = sub(pattern, replacement, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


class BitWidthVisitor(ast.NodeVisitor):
    def __init__(self, signal_names, new_width):
        self.signal_names = signal_names
        self.new_width = new_width

    def visit(self, node):
        if isinstance(node, ast.Decl):
            for item in node.list:
                if hasattr(item, "name") and item.name in self.signal_names:
                    # Update bit width specification
                    item.width = self.new_width

        # Visit children
        for c in node.children():
            self.visit(c)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument(
        "output_file",
        help="Output Verilog file with transformed bit widths",
    )
    parser.add_argument(
        "--signal_names",
        nargs="+",
        default=[],
        help="List of signal names to update (default: all)",
    )
    parser.add_argument("--new_width", type=int, default=32)
    args = parser.parse_args()

    # Validate input
    if not os.path.isfile(args.input_file):
        raise ValueError("Input file does not exist")

    # Transform bit widths
    transform_bitwidth(
        args.input_file,
        args.output_file,
        signal_names=args.signal_names,
        new_width=args.new_width,
    )


if __name__ == "__main__":
    main()
```