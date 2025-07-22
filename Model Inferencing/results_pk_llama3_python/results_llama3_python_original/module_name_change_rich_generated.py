```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
import argparse


class ChangeModuleNameVisitor(ast.ASTVisitor):
    def __init__(self, old_name, new_name):
        self.old_name = old_name
        self.new_name = new_name

    def visit(self, node):
        if isinstance(node, ast.Decl):
            for item in node.list:
                if hasattr(item, "name") and item.name == self.old_name:
                    item.name = self.new_name
                    self.changes_made.append(f"Found {self.old_name} and changed to {self.new_name}")
        elif isinstance(node, ast.Endmodule):
            if findall(self.old_name, node.comment):
                node.comment = sub(self.old_name, self.new_name, node.comment)
                self.changes_made.append(f"Comment found with old name: {node.comment}")

        for c in node.children():
            self.visit(c)


def transform(input_file, output_file, old_name, new_name):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = ChangeModuleNameVisitor(old_name, new_name)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    modified_content = sub(findall(self.old_name, content), self.new_name, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input file")
    parser.add_argument("output", help="Output file")
    parser.add_argument("old_name", help="Old module name")
    parser.add_argument("new_name", help="New module name")

    args = parser.parse_args()

    transform(args.input, args.output, args.old_name, args.new_name)


if __name__ == "__main__":
    main()
```