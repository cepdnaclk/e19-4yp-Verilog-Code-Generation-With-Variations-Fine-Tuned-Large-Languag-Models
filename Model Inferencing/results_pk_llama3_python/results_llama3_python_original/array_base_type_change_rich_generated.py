```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
from argparse import ArgumentParser


class ArrayTypeTransformer(ast.NodeVisitor):
    def __init__(self, old_type, new_type):
        self.old_type = old_type
        self.new_type = new_type

    def visit_Decl(self, node):
        if isinstance(node.base_type, ast.ArrayType) and \
                node.base_type.type == self.old_type:
            # Replace base type with new one
            node.base_type.type = self.new_type

            # Handle width specifications appropriately for new type
            if node.width_specified:
                node.width = int(findall(r'\d+', str(node.width))[0])

        super().visit_Decl(node)

    def visit(self, node):
        super().visit(node)


def transform(input_file, output_file, old_type, new_type):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = ArrayTypeTransformer(old_type, new_type)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = sub(r'(\s+)(\w+)\[(\d+)\](\s+)', r'\1logic[\3]\4', content)
    modified_content = sub(r'(\s+)(\w+)\[(\d+)\](\s+)', r'\1byte[\3]\4', modified_content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("input", help="Input Verilog file")
    parser.add_argument("output", help="Output Verilog file")
    parser.add_argument("--old_type", default="bit", help="Old array type (default: bit)")
    parser.add_argument("--new_type", default="logic", help="New array type (default: logic)")

    args = parser.parse_args()

    transform(args.input, args.output, args.old_type, args.new_type)
```