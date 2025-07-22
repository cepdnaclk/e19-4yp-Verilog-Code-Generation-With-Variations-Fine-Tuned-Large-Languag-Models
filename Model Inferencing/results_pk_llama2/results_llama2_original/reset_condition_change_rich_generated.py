Here is a transformation module for the xform framework that performs the task of changing the reset condition from active-high to active-low or vice versa:
```python
import pyverilog
from pyverilog import *
from re import sub
from argparse import ArgumentParser

class ResetVisitor(pyverilog.NodeVisitor):
    def __init__(self, signal_name):
        self.signal_name = signal_name
        self.changes_made = []
        self.signal_found = False

    def visit(self, node):
        if isinstance(node, Node):
            # Check for target declarations
            if isinstance(node, Decl) and node.name == "reset":
                self.signal_found = True
                self.changes_made.append(f"Found {self.signal_name}")

            # Visit children
            for c in node.children():
                self.visit(c)

    def transform(self, input_file, output_file):
        # Parse AST
        ast, directives = parse([input_file])

        # Apply visitor
        visitor = ResetVisitor(self.signal_name)
        visitor.visit(ast)

        # Perform text transformations
        with open(input_file, "r") as f:
            content = f.read()
        modified_content = sub(pattern=r'\b(?:if|case)\s+rst\b', repl=r'\1 !rst', content=content)
        with open(output_file, "w") as f:
            f.write(modified_content)

        return True

def main():
    parser = ArgumentParser()
    parser.add_argument("-s", "--signal", required=True, help="Reset signal name")
    parser.add_argument("-i", "--input", required=True, help="Input file")
    parser.add_argument("-o", "--output", required=True, help="Output file")

    args = parser.parse_args()

    transformer = ResetVisitor(args.signal)
    transformer.transform(args.input, args.output)

if __name__ == "__main__":
    main()
```
Explanation:

1. The `ResetVisitor` class inherits from the `pyverilog.NodeVisitor` class and defines a few attributes to keep track of the changes made during the visit process.
2. The `visit` method is overridden to check for `Decl` nodes that represent reset signals, and if found, it adds the signal name to the `changes_made` list and sets the `signal_found` flag to `True`.
3. The `transform` method parses the AST using `parse`, applies the visitor to the AST, and then performs text transformations on the input file using `sub`. The modified content is then written to the output file.
4. The `main` function defines an argument parser using `ArgumentParser` and adds arguments for the signal name, input file, and output file. It then calls the `transform` method on the `ResetVisitor` instance with the provided arguments.
5. The `if __name__ == "__main__":` block is used to ensure that the main function is only executed when the script is run directly (i.e., not when it is imported as a module).

Note: This transformation assumes that the reset signal is used in an `if` or `case` statement. If the reset signal is used in other contexts, such as a `while` loop or a `for` loop, additional modifications may be required.