import pyverilog.ast.tools as asttools
from pyverilog.ast import *
import re

class RenameFSMStates(asttools.Visitor):
    def __init__(self, old_prefix, new_prefix):
        self.old_prefix = old_prefix
        self.new_prefix = new_prefix
    
    def visit(self, node):
        if isinstance(node, EnumDecl):
            # Identify FSM state enum/parameter declarations
            for item in node.items:
                if re.match(r'^\s*' + self.old_prefix + r'\w+$', item.name):
                    item.name = self.new_prefix + item.name[1:]
        
        elif isinstance(node, CaseItem):
            # Update all references in case statements
            for item in node.items:
                if re.match(r'^\s*' + self.old_prefix + r'\w+$', item.expr):
                    item.expr = self.new_prefix + item.expr[1:]

        elif isinstance(node, AssignStmt):
            # Update assignments and comparisons
            for item in node.assignments:
                if re.match(r'^\s*' + self.old_prefix + r'\w+$', item.lhs):
                    item.lhs = self.new_prefix + item.lhs[1:]
        
        return super().visit(node)

def transform(old_prefix, new_prefix, filename):
    # Parse and analyze the AST
    ast = asttools.parse(filename)
    
    # Create a visitor class to identify target elements  
    visitor = RenameFSMStates(old_prefix, new_prefix)
    
    # Use regex to perform the actual text transformations
    visitor.visit(ast)
    
    # Include proper error handling and validation
    if not visitor.success:
        print("Transformation failed!")
        return False
    
    # Return True/False for success/failure
    return True

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='Verilog file to transform')
    parser.add_argument('-o', '--old_prefix', default='OLD_PREFIX',
                        help='Old prefix of FSM states (default: OLD_PREFIX)')
    parser.add_argument('-n', '--new_prefix', default='NEW_PREFIX',
                        help='New prefix of FSM states (default: NEW_PREFIX)')
    args = parser.parse_args()
    
    if transform(args.old_prefix, args.new_prefix, args.filename):
        print("Transformation successful!")
    else:
        print("Transformation failed!")

if __name__ == '__main__':
    main()