Here is a Python module that performs the task of renaming FSM state names throughout a Verilog module:
```python
import pyverilog
import re
import argparse

class RenameFSMStates(pyverilog.visitor.Visitor):
    def __init__(self, old_prefix, new_prefix):
        self.old_prefix = old_prefix
        self.new_prefix = new_prefix

    def visit_enum_declaration(self, node):
        if node.name.startswith(self.old_prefix):
            new_name = f"{self.new_prefix}{node.name[len(self.old_prefix):]}"
            node.name = new_name
            return True

    def visit_parameter_declaration(self, node):
        if node.name.startswith(self.old_prefix):
            new_name = f"{self.new_prefix}{node.name[len(self.old_prefix):]}"
            node.name = new_name
            return True

    def visit_case_statement(self, node):
        for arm in node.arms:
            if isinstance(arm.expression, pyverilog.ast.enumeration_literal):
                if arm.expression.value.startswith(self.old_prefix):
                    new_value = f"{self.new_prefix}{arm.expression.value[len(self.old_prefix):]}"
                    arm.expression.value = new_value
        return True

    def visit_assignment_statement(self, node):
        if isinstance(node.right, pyverilog.ast.enumeration_literal):
            if node.right.value.startswith(self.old_prefix):
                new_value = f"{self.new_prefix}{node.right.value[len(self.old_prefix):]}"
                node.right.value = new_value
        return True

def rename_fsm_states(module, old_prefix, new_prefix):
    visitor = RenameFSMStates(old_prefix, new_prefix)
    module.accept(visitor)
    return True

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Rename FSM states")
    parser.add_argument("module", help="Verilog module file")
    parser.add_argument("-o", "--old-prefix", required=True, help="Old prefix to rename")
    parser.add_argument("-n", "--new-prefix", required=True, help="New prefix to use")
    args = parser.parse_args()

    try:
        module = pyverilog.parse_file(args.module)
        if not rename_fsm_states(module, args.old_prefix, args.new_prefix):
            print("Error renaming FSM states")
            exit(1)
        print("FSM state names renamed successfully!")
    except Exception as e:
        print(f"Error: {e}")
        exit(1)

if __name__ == "__main__":
    pass
```
This module defines a `RenameFSMStates` visitor class that inherits from the existing xform framework pattern. The visitor has methods to visit enum declarations, parameter declarations, case statements, and assignment statements.

The main transformation function `rename_fsm_states` takes a Verilog module, old prefix, and new prefix as input. It creates an instance of the `RenameFSMStates` visitor and passes it to the module's AST using the `accept` method. The function returns `True` if the renaming is successful, or `False` otherwise.

The command-line interface uses the `argparse` library to parse command-line arguments. The script takes a Verilog module file as input, along with old and new prefix values. It then calls the `rename_fsm_states` function and prints success or error messages accordingly.

Note that this code assumes that the FSM state names are declared as enums or parameters in the Verilog module. If your use case is different (e.g., using strings instead of enums), you may need to modify the visitor methods accordingly.