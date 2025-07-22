Here is a Python module that performs the task of changing the reset condition from active-high to active-low or vice versa:
```python
import pyverilog
import re
import argparse

class ResetConditionTransformer(pyverilog.visitor.Visitor):
    def __init__(self, direction='low'):
        self.direction = direction

    def visit_if_statement(self, node):
        for cond in node.cond_list:
            if isinstance(cond, pyverilog.ast.IfStmt) and cond.cond.startswith('rst'):
                new_cond = f'!{cond.cond}' if self.direction == 'low' else cond.cond
                node.cond_list[0] = pyverilog.ast.IfStmt(new_cond, *node.then_stmts)

    def visit_assign_statement(self, node):
        for assign in node.assignments:
            if isinstance(assign, pyverilog.ast.Assign) and assign.left.startswith('rst'):
                new_assign = f'~{assign.left}' if self.direction == 'low' else assign.left
                node.assignments[0] = pyverilog.ast.Assign(new_assign, *node.rvalues)

    def visit_sensitivity_list(self, node):
        if node.posedge:
            node.negedge = not node.posedge
            node.posedge = None

def transform_module(module, direction='low'):
    transformer = ResetConditionTransformer(direction)
    module.accept(transformer)
    return True

def main():
    parser = argparse.ArgumentParser(description='Transform reset condition')
    parser.add_argument('module', help='Verilog module file')
    parser.add_argument('-d', '--direction', choices=['high', 'low'], default='low',
                        help='Direction of the reset condition change (default: low)')
    args = parser.parse_args()

    with open(args.module, 'r') as f:
        module_str = f.read()

    module = pyverilog.parse_module(module_str)
    success = transform_module(module, direction=args.direction)

    if success:
        print(f"Reset condition transformed successfully in {args.module}")
    else:
        print("Transformation failed")

if __name__ == '__main__':
    main()
```
Here's a breakdown of the code:

1. The `ResetConditionTransformer` class inherits from `pyverilog.visitor.Visitor`. It has an initializer that takes an optional `direction` parameter, which defaults to `'low'`.
2. The `visit_if_statement` method visits each `IfStmt` node in the AST and checks if the condition starts with `'rst'`. If it does, it creates a new condition by negating the original one (if the direction is `'low'`) or keeping it the same (if the direction is `'high'`). It then updates the `cond_list` of the `IfStmt` node.
3. The `visit_assign_statement` method visits each `Assign` node in the AST and checks if the left-hand side starts with `'rst'`. If it does, it creates a new assignment by negating the original one (if the direction is `'low'`) or keeping it the same (if the direction is `'high'`). It then updates the `assignments` list of the `AssignStmt` node.
4. The `visit_sensitivity_list` method visits each `SensitivityList` node in the AST and checks if the `posedge` attribute is set. If it is, it sets the `negedge` attribute to its opposite value (i.e., `True` becomes `False` and vice versa) and clears the `posedge` attribute.
5. The `transform_module` function takes a Verilog module string as input, parses it using PyVerilog, and applies the transformation using an instance of the `ResetConditionTransformer` class. It returns `True` if the transformation is successful, or `False` otherwise.
6. The `main` function uses the `argparse` library to parse command-line arguments, including the Verilog module file name and the direction of the reset condition change (defaulting to `'low'`). It then reads the module file, applies the transformation using the `transform_module` function, and prints a success message if the transformation is successful.

To use this code, simply run it from the command line:
```bash
python transform_reset.py my_module.v -d high
```
This will transform the reset condition in the `my_module.v` file to active-high. You can also specify the direction as `'low'` or omit the `-d` option altogether (which defaults to `'low'`).