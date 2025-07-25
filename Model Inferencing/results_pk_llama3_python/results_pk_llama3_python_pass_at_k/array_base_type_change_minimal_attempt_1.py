# Generated by Ollama Llama 3
# Task: array_base_type_change_minimal
# Attempt: 1
# Success: False
# Overall Score: 0.492

import sys 
sys.path.append('../') # add parent directory to path

from pyverilog.ast.utils.visitor import *
from pyverilog.parser import parse
from pyverilog.ast import *

# Import xforms module
import xforms

# Define function to transform array declaration base type
def change_array_type(ast, arg):
    """Transform the base type of an array declaration"""

    # Get AST from string or file
    if isinstance(arg, str) and not isinstance(arg, ast):
        ast = parse(arg)

    # Get input arguments
    old_type = 'bit'
    new_type = 'logic'

    # Create visitor class to identify target elements
    class ChangeArrayTypeVisitor(ASTVisitor): 
        def __init__(self, ast, old_type, new_type):
            self.ast = ast
            self.old_type = old_type
            self.new_type = new_type

        def visit_Decl(self, node): 
            if isinstance(node.baseType.value, str) and node.baseType.value == self.old_type:
                node.baseType.value = self.new_type
            return node
        
    # Instantiate visitor class
    c = ChangeArrayTypeVisitor(ast, old_type, new_type)

    # Run transformation on AST
    transformed_ast = c.visit(ast)

    # Return transformed AST 
    return transformed_ast

# Define command line interface for change_array_type function
def main():
    parser = argparse.ArgumentParser(description='Transform the base type of an array declaration')
    parser.add_argument('input', nargs='?', default=sys.stdin, help='input file or string containing Verilog code')
    parser.add_argument('--old-type', '-o', dest='oldType', required=True, help='original base type (bit)')
    parser.add_argument('--new-type', '-n', dest='newType', required=True, help='desired new base type (logic)')

    args = parser.parse_args()

    transformed_ast = change_array_type(args.input, old_type=args.oldType, new_type=args.newType)

    print(transformed_ast)

if __name__ == '__main__':
    main()