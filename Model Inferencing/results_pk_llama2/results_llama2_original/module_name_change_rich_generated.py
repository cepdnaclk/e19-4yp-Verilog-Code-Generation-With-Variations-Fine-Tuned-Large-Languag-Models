Here is a complete Python module that performs the task of changing a module name throughout a Verilog/SystemVerilog file using the xform framework:
```python
import pyverilog
from pyverilog.ast import *
from re import sub
from argparse import ArgumentParser

class ModuleNameTransformer(pyverilog.visitors.Pattern):
    def __init__(self, old_name, new_name):
        super().__init__()
        self.old_name = old_name
        self.new_name = new_name
        self.found = False
        self.changes = []

    def visit(self, node):
        if isinstance(node, Node):
            # Check for module declarations
            if isinstance(node, Decl) and node.kind == Kind.MODULE:
                self.found = True
                self.changes.append(f"Found {self.old_name}")
                self.changes.append(f"Replacing with {self.new_name}")
                # Replace module name in declaration
                node.name = self.new_name
                # Update endmodule comments if they reference module name
                for c in node.children():
                    if isinstance(c, Comment):
                        if c.text.startswith("endmodule"):
                            c.text = f"endmodule {self.new_name}"
                # Visit children
                for c in node.children():
                    self.visit(c)
            # Visit children
            for c in node.children():
                self.visit(c)
        elif isinstance(node, str):
            # Check for module name in string
            if node.startswith(self.old_name):
                self.found = True
                self.changes.append(f"Found {self.old_name}")
                self.changes.append(f"Replacing with {self.new_name}")
                # Replace module name in string
                node = f"{self.new_name}{node[len(self.old_name):}"
                # Preserve port lists and contents
                for p in node.split():
                    self.changes.append(p)
        else:
            super().visit(node)

def transform_file(input_file, output_file, old_name, new_name):
    # Parse AST
    ast = parse([input_file])

    # Apply visitor
    visitor = ModuleNameTransformer(old_name, new_name)
    visitor.visit(ast)

    # Perform text transformations
    with open(output_file, "w") as f:
        f.write(sub(old_name, new_name, ast))

    return True

def main():
    parser = ArgumentParser()
    parser.add_argument("-i", "--input", required=True, help="Input file")
    parser.add_argument("-o", "--output", required=True, help="Output file")
    parser.add_argument("old_name", help="Old module name")
    parser.add_argument("new_name", help="New module name")

    args = parser.parse_args()

    transform_file(args.input, args.output, args.old_name, args.new_name)

if __name__ == "__main__":
    main()
```
Here's how the code works:

1. The `ModuleNameTransformer` class inherits from the `pyverilog.visitors.Pattern` class and defines a few attributes: `old_name`, `new_name`, and `found`. It also defines two methods: `visit` and `changes`.
2. The `visit` method is where the magic happens. It checks if the current node is a module declaration, and if so, it replaces the old module name with the new one. If the current node is a string, it checks if the string starts with the old module name, and if so, it replaces the old module name with the new one.
3. The `changes` method is used to keep track of the changes made by the visitor. It appends each change to a list.
4. The `transform_file` function parses the AST using `pyverilog.parse`, creates a `ModuleNameTransformer` instance, and applies it to the AST using the `visit` method. It then performs text transformations by writing the modified file contents to the output file.
5. The `main` function is where you would call the `transform_file` function. It takes in the input file, output file, old module name, and new module name as command-line arguments.

To use the transformation, you can run the script with the following command:
```bash
python transform.py -i input.v --output output.v --old_name my_module --new_name my_new_module
```
This will transform the `input.v` file to produce an updated `output.v` file with the old module name replaced by the new one.