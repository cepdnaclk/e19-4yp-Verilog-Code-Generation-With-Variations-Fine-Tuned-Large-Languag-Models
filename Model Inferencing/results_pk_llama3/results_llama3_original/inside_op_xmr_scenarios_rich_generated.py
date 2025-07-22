Here is a Python module that implements the task of creating test cases for inside operator with cross-module references using the xform framework:
```python
import pyverilog
import re
import argparse

class XMRTestVisitor(pyverilog.visitor.Visitor):
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, pyverilog.ast.Module):
            # Check for module declarations with inside operator
            for decl in node.decls:
                if isinstance(decl, pyverilog.ast.PortDecl) and decl.direction == 'input':
                    for item in decl.items:
                        if hasattr(item, "name") and item.name == self.signal_name:
                            self.signal_found = True
                            self.changes_made.append(f"Found {self.signal_name} inside module")

            # Visit children
            for c in node.children():
                self.visit(c)

        elif isinstance(node, pyverilog.ast.Interface):
            # Check for interface declarations with inside operator
            if node.direction == 'input':
                for item in node.items:
                    if hasattr(item, "name") and item.name == self.signal_name:
                        self.signal_found = True
                        self.changes_made.append(f"Found {self.signal_name} inside interface")

            # Visit children
            for c in node.children():
                self.visit(c)

def transform_xmr(input_file, output_file, signal_name):
    # Parse AST
    ast, directives = pyverilog.parse([input_file])

    # Apply visitor
    visitor = XMRTestVisitor(signal_name)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = re.sub(r"inside\s+module\s+(\w+)\s*\(", r"inside module \1(\g<1>),", content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

def main():
    parser = argparse.ArgumentParser(description='XMR Test Case Generator')
    parser.add_argument('input_file', help='Input Verilog file')
    parser.add_argument('output_file', help='Output transformed file')
    parser.add_argument('--signal_name', required=True, help='Signal name to search for')

    args = parser.parse_args()

    if not transform_xmr(args.input_file, args.output_file, args.signal_name):
        print("Transformation failed!")

if __name__ == '__main__':
    main()
```
This module defines a `XMRTestVisitor` class that inherits from the existing xform visitor pattern. The visitor class identifies target elements in the AST, such as modules and interfaces with inside operators, and checks for cross-module references.

The `transform_xmr` function takes an input file, output file, and signal name as arguments. It parses the input file using PyVerilog, applies the visitor to the AST, and then performs regex transformations on the original content to create test cases.

The main function uses the `argparse` library to define a command-line interface for the transformation module. The user can specify the input file, output file, and signal name as arguments.

Note that this implementation assumes that the inside operator is used with modules and interfaces, and that cross-module references are made using the `inside` keyword. You may need to modify the regex patterns or add additional logic to handle more complex scenarios.