Here is a Python module that performs the task of changing the base type of an array declaration:
```python
import pyverilog
import re
import argparse

class ArrayTypeTransformer(pyverilog.visitors.PatternVisitor):
    def __init__(self, old_type, new_type):
        self.old_type = old_type
        self.new_type = new_type

    def visit_ArrayDecl(self, node):
        if node.base_type == self.old_type:
            # Replace base type and handle width specifications
            new_base_type = self.new_type
            if node.width_specified:
                new_width = int(node.width) * self.get_width_factor(new_base_type)
            else:
                new_width = None

            # Update the array declaration with the new base type
            node.base_type = new_base_type
            node.width = new_width

    def get_width_factor(self, new_type):
        if new_type == 'logic':
            return 1
        elif new_type == 'byte':
            return 8
        else:
            raise ValueError(f"Unsupported type: {new_type}")

def transform_file(input_file, output_file, old_type, new_type):
    """
    Transform the input Verilog file by changing the base type of array declarations.

    Args:
        input_file (str): Input Verilog file path.
        output_file (str): Output Verilog file path.
        old_type (str): Current base type to replace.
        new_type (str): New base type to use.

    Returns:
        bool: True if the transformation was successful, False otherwise.
    """
    # Parse the input file using PyVerilog
    ast = pyverilog.parse_file(input_file)

    # Create a visitor instance with the old and new types
    transformer = ArrayTypeTransformer(old_type, new_type)

    # Visit each node in the AST and apply the transformation
    for node in ast.traverse(transformer):
        pass

    # Generate the transformed code using PyVerilog's generate_file method
    try:
        output_code = pyverilog.generate_file(ast)
    except Exception as e:
        print(f"Error generating output file: {e}")
        return False

    # Write the transformed code to the output file
    with open(output_file, 'w') as f:
        f.write(output_code)

    return True

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Array Type Transformer')
    parser.add_argument('input_file', help='Input Verilog file path')
    parser.add_argument('output_file', help='Output Verilog file path')
    parser.add_argument('--old-type', required=True, help='Current base type to replace')
    parser.add_argument('--new-type', required=True, help='New base type to use')

    args = parser.parse_args()

    if not transform_file(args.input_file, args.output_file, args.old_type, args.new_type):
        print("Transformation failed")
```
Here's a breakdown of the code:

1. The `ArrayTypeTransformer` class inherits from `pyverilog.visitors.PatternVisitor`. It has two instance variables: `old_type` and `new_type`, which are used to store the current and new base types, respectively.
2. The `visit_ArrayDecl` method is called when visiting an array declaration node in the AST. It checks if the base type of the array matches the old type, and if so, replaces it with the new type while handling width specifications appropriately.
3. The `get_width_factor` method returns a factor to multiply the original width by when converting from the old type to the new type.
4. The `transform_file` function takes four arguments: input file path, output file path, old type, and new type. It parses the input file using PyVerilog, creates a visitor instance with the old and new types, visits each node in the AST, generates the transformed code, and writes it to the output file.
5. The `if __name__ == '__main__':` block defines a command-line interface using `argparse`. It parses the input file path, output file path, old type, and new type from the command line, and calls the `transform_file` function with these arguments.

To use this module, save it to a file (e.g., `array_type_transformer.py`) and run it from the command line:
```bash
python array_type_transformer.py input.v output.v --old-type bit --new-type logic
```
This will transform the `input.v` file by changing all occurrences of `bit` arrays to `logic` arrays, and write the transformed code to `output.v`.