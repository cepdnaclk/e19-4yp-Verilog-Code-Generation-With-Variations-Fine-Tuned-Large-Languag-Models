Here is a Python module that performs the task of converting signals to use different structure types:
```python
import pyverilog.ast as ast
import re
import argparse

class SignalConverterVisitor(ast.Visitor):
    def __init__(self, signal_name, target_type):
        self.signal_name = signal_name
        self.target_type = target_type
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, ast.Signal):
            if node.name == self.signal_name:
                self.signal_found = True
                self.changes_made.append(f"Found {self.signal_name}")

                # Convert signal to target type (struct/union)
                if self.target_type == "struct":
                    node.type = ast.StructType()
                elif self.target_type == "union":
                    node.type = ast.UnionType()

        # Visit children
        for c in node.children():
            self.visit(c)

def transform_signal(input_file, output_file, signal_name, target_type):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = SignalConverterVisitor(signal_name, target_type)
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Convert signal declarations to new type
    pattern = r"signal\s+({0})\s*\(([^)]*)\);".format(signal_name)
    replacement = r"signal {0} ({1});".format(target_type, signal_name)

    modified_content = re.sub(pattern, replacement, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

def main():
    parser = argparse.ArgumentParser(description="Convert signals to use different structure types")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("-s", "--signal_name", required=True, help="Name of the signal to convert")
    parser.add_argument("-t", "--target_type", choices=["struct", "union"], required=True, help="Target type for the signal conversion")

    args = parser.parse_args()

    if not transform_signal(args.input_file, args.output_file, args.signal_name, args.target_type):
        print("Error: Transformation failed")
        return 1

    print("Transformation successful!")

if __name__ == "__main__":
    main()
```
This module defines a `SignalConverterVisitor` class that inherits from the existing xform framework pattern. The visitor class identifies signal declarations and converts them to the target type (struct or union) by modifying the AST.

The `transform_signal` function takes in the input file, output file, signal name, and target type as arguments. It parses the AST using PyVerilog, applies the visitor, and then performs regex transformations to convert the signal declarations to the new type.

The `main` function provides a command-line interface using argparse, allowing users to specify the input file, output file, signal name, and target type. The function calls `transform_signal` with the specified arguments and prints success or error messages accordingly.

Note that this code assumes that the signal declaration is in the format `signal <name> (<type>)`. You may need to modify the regex pattern if your signal declarations have a different format.