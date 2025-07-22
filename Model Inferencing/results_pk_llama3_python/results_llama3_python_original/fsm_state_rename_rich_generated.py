```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
import argparse


class RenameFSMStatesVisitor(ast.NodeVisitor):
    def __init__(self, old_prefix, new_prefix):
        self.old_prefix = old_prefix
        self.new_prefix = new_prefix

    def visit(self, node):
        if isinstance(node, ast.Decl):
            for item in node.list:
                if hasattr(item, "name") and item.name == 'enum':
                    # Enum declaration found
                    enum_name = item.value[0].value
                    old_states = findall(r'(\w+)', item.value[1].value)
                    new_states = [self.new_prefix + state for state in old_states]
                    self.changes_made.append(f"Renamed {enum_name} states from {old_states} to {new_states}")

                elif hasattr(item, "name") and item.name == 'parameter':
                    # Parameter declaration found
                    param_name = item.value[0].value
                    old_states = findall(r'(\w+)', item.value[1].value)
                    new_states = [self.new_prefix + state for state in old_states]
                    self.changes_made.append(f"Renamed {param_name} states from {old_states} to {new_states}")

        # Visit children
        for c in node.children():
            self.visit(c)

def transform(input_file, output_file, old_prefix, new_prefix):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = RenameFSMStatesVisitor(old_prefix, new_prefix)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    modified_content = sub(r'(\b{}\w+)(\s*=\s*)(\w+)'.format(old_prefix), r'\1 \2{}'.format(new_prefix), content)
    modified_content = sub(r'(\b{}\w+)\s*(==|!=)\s*(\w+)'.format(old_prefix), r'\1 \2{}'.format(new_prefix), modified_content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('input', help='Input file')
    parser.add_argument('output', help='Output file')
    parser.add_argument('--old_prefix', default='state_', help='Old prefix for state names (default: state_)')
    parser.add_argument('--new_prefix', default='next_state_', help='New prefix for state names (default: next_state_)')

    args = parser.parse_args()

    if transform(args.input, args.output, args.old_prefix, args.new_prefix):
        print("Transformation successful!")
```