Here is a Python module that generates test cases for using arrays in inside operator:
```python
import pyverilog
import re
import argparse

class ArrayInsideVisitor(pyverilog.visitor.ASTVisitor):
    def __init__(self):
        self.test_cases = []

    def visit_array(self, node):
        if node.dimensions > 1:  # multi-dimensional array
            for i in range(node.dimensions):
                self.visit_array_slice(node, i)
                self.visit_array_part_select(node, i)

    def visit_array_slice(self, node, dim):
        index = f"dim_{dim}"
        self.test_cases.append(f"test_array_slice({node.name}, {index})")

    def visit_array_part_select(self, node, dim):
        index = f"dim_{dim}"
        self.test_cases.append(f"test_array_part_select({node.name}, {index})")

    def visit_inside_operator(self, node):
        if isinstance(node.expr, pyverilog.ast.ArrayRef):
            array_name = node.expr.array.name
            for i in range(len(node.expr.index)):
                index = f"{i}"
                self.test_cases.append(f"test_array_inside({array_name}, {index})")

def transform_module(module):
    visitor = ArrayInsideVisitor()
    module.accept(visitor)
    return visitor.test_cases

def main():
    parser = argparse.ArgumentParser(description="Generate test cases for array inside operator")
    parser.add_argument("module", help="Verilog module file")
    args = parser.parse_args()

    with open(args.module, "r") as f:
        module = pyverilog.parse_file(f.read())

    test_cases = transform_module(module)
    print("\n".join(test_cases))

if __name__ == "__main__":
    main()
```
Here's a breakdown of the code:

1. We define an `ArrayInsideVisitor` class that inherits from `pyverilog.visitor.ASTVisitor`. This visitor will traverse the AST and generate test cases for array inside operator.
2. In the `visit_array` method, we check if the array is multi-dimensional (i.e., has more than one dimension). If so, we recursively call `visit_array_slice` and `visit_array_part_select` methods to generate test cases for array slicing and part selection.
3. The `visit_array_slice` and `visit_array_part_select` methods generate test case strings by concatenating the array name with the slice or part select index.
4. In the `visit_inside_operator` method, we check if the inside operator expression is an array reference. If so, we generate test cases for each dimension of the array by iterating over the indices and generating test case strings.
5. The `transform_module` function takes a Verilog module as input, creates an instance of the visitor, and calls the visitor's `accept` method to traverse the AST. It then returns the list of generated test cases.
6. In the `main` function, we parse the command-line arguments using `argparse`, read the Verilog module file, and call the `transform_module` function to generate test cases. We print the test cases to the console.

To use this code, simply run it from the command line:
```bash
python array_inside_xform.py my_module.v
```
This will generate a list of test case strings that can be used to create test cases for using arrays in inside operator.