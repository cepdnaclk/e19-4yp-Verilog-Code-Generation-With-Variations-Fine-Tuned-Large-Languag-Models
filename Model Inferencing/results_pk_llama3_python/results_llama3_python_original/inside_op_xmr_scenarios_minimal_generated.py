import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import find_all
from pyverilog.ast.utils import find_first
from pyverilog.ast.utils import find_last
from pyverilog.ast.utils import find_between
from pyverilog.ast.utils import find_between_any
import re

def xform_inside_operator_with_cross_module_references(ast, args):
    # Find all inside operators
    inside_operators = find_all(ast, ast.Inside)

    for operator in inside_operators:
        # Get the left and right operands
        left_operand = operator.left
        right_operand = operator.right

        # Check if either operand is a cross-module reference
        if isinstance(left_operand, ast.CrossModuleReference):
            print("Found cross-module reference on left side of inside operator")
            return True
        elif isinstance(right_operand, ast.CrossModuleReference):
            print("Found cross-module reference on right side of inside operator")
            return True

    # If no cross-module references were found, return False
    return False