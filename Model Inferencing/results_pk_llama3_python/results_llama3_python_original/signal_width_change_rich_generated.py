```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, compile
import argparse


class ChangeSignalWidthVisitor(ast.NodeVisitor):
    def __init__(self, signal_name, new_width):
        self.signal_name = signal_name
        self.new_width = new_width

    def visit_Decl(self, node):
        if isinstance(node, ast.Decl) and node.name == self.signal_name:
            for item in node.list:
                if hasattr(item, "width") and item.width != self.new_width:
                    item.width = self.new_width
                    print(f"Changed {self.signal_name} width to {self.new_width}")
        super().visit_Decl(node)

    def visit_Reg(self, node):
        if isinstance(node, ast.Reg) and node.name == self.signal_name:
            for item in node.list:
                if hasattr(item, "width") and item.width != self.new_width:
                    item.width = self.new_width
                    print(f"Changed {self.signal_name} width to {self.new_width}")
        super().visit_Reg(node)

    def visit_Wire(self, node):
        if isinstance(node, ast.Wire) and node.name == self.signal_name:
            for item in node.list:
                if hasattr(item, "width") and item.width != self.new_width:
                    item.width = self.new_width
                    print(f"Changed {self.signal_name} width to {self.new_width}")
        super().visit_Wire(node)

    def visit_Input(self, node):
        if isinstance(node, ast.Input) and node.name == self.signal_name:
            for item in node.list:
                if hasattr(item, "width") and item.width != self.new_width:
                    item.width = self.new_width
                    print(f"Changed {self.signal_name} width to {self.new_width}")
        super().visit_Input(node)

    def visit_Output(self, node):
        if isinstance(node, ast.Output) and node.name == self.signal_name:
            for item in node.list:
                if hasattr(item, "width") and item.width != self.new_width:
                    item.width = self.new_width
                    print(f"Changed {self.signal_name} width to {self.new_width}")
        super().visit_Output(node)


def transform(input_file, output_file, signal_name, new_width):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = ChangeSignalWidthVisitor(signal_name, new_width)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = sub(compile(r'(?<=\b)(?P<signal>{})(?=\s*:\s*\w+)'.format(signal_name)), r'\g<signal>{:d}'.format(new_width), content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("signal_name", help="Signal name to change width for")
    parser.add_argument("new_width", type=int, help="New signal width")

    args = parser.parse_args()

    transform(args.input_file, args.output_file, args.signal_name, args.new_width)
```