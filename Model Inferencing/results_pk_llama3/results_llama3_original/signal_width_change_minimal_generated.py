Here is a Python module that performs the task of changing a signal's bit width specification using the xform framework:
```python
import pyverilog
import re
import argparse

class BitWidthTransformer(pyverilog.visitor.Visitor):
    def __init__(self, new_width):
        self.new_width = new_width

    def visit_signal(self, node):
        if node.width is not None:
            old_width = str(node.width)
            new_width_str = f"{self.new_width}"
            node.width = pyverilog.ast.Width(new_width_str)

class ChangeSignalBitWidth(pyverilog.xform.XForm):
    def __init__(self, new_width):
        self.new_width = new_width

    def apply(self, ast):
        transformer = BitWidthTransformer(self.new_width)
        ast.accept(transformer)
        return True

def main():
    parser = argparse.ArgumentParser(description='Change signal bit width')
    parser.add_argument('new_width', type=int, help='New bit width')
    args = parser.parse_args()

    xform = ChangeSignalBitWidth(args.new_width)

    # Load the Verilog file
    with open('input.v', 'r') as f:
        verilog_code = f.read()

    # Apply the transformation
    transformed_code = pyverilog.parser.Parser().parse_string(verilog_code).accept(xform)

    # Write the transformed code to a new file
    with open('output.v', 'w') as f:
        f.write(str(transformed_code))

if __name__ == '__main__':
    main()
```
Here's an explanation of the code:

1. The `BitWidthTransformer` class is a visitor that inherits from `pyverilog.visitor.Visitor`. It takes a new width as input and has a single method `visit_signal`, which checks if the signal has an existing width, and if so, replaces it with the new width.
2. The `ChangeSignalBitWidth` class is an xform that applies the transformation to the Verilog AST. It takes a new width as input and has a single method `apply`, which creates an instance of the `BitWidthTransformer` and applies it to the AST.
3. The `main` function sets up the command-line interface using `argparse`, loads the Verilog file, applies the transformation, and writes the transformed code to a new file.

To use this module, simply run it from the command line:
```
$ python change_signal_bit_width.py 32
```
This will transform the input Verilog file (`input.v`) and write the result to a new file (`output.v`). The `new_width` argument specifies the new bit width for the signals.

Note that this module assumes that the signal declaration has an existing width specification (e.g., `wire [31:0] my_signal;`). If the signal does not have a width specification, the transformation will not modify it.