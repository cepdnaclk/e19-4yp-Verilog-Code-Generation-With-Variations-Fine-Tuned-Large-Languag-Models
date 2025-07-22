import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
from argparse import ArgumentParser

class ResetVisitor:
    def __init__(self):
        self.changes_made = []
        self.reset_found = False
    
    def visit(self, node):
        if isinstance(node, Node):
            # Check for reset declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == 'reset':
                        self.reset_found = True
                        self.changes_made.append(f"Found {item.name}")
            
            # Visit children
            for c in node.children():
                self.visit(c)

def transform_reset(input_file, output_file):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = ResetVisitor()
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Find reset signal usage in if statements
    reset_if_statements = findall(r'if\s*\(\s*\(reset\s*,\s*(?P<condition>.+)\)\)', content)

    # Change if(rst) to if(!rst)
    for statement in reset_if_statements:
        condition = statement.group('condition')
        modified_condition = sub(r'\breset\b', '!reset', condition)
        modified_statement = f'if ({modified_condition})'
        content = sub(statement, modified_statement, content)

    # Update sensitivity lists (posedge to negedge)
    reset_sensitivity_lists = findall(r'sensitive\s*\(\s*\(posedge\s*(?P<signal>\w+)\)\)', content)
    for statement in reset_sensitivity_lists:
        signal = statement.group('signal')
        modified_statement = f'sensitive (\!{signal})'
        content = sub(statement, modified_statement, content)

    # Write output
    with open(output_file, "w") as f:
        f.write(content)

    return True

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('input_file', help='Input Verilog file')
    parser.add_argument('output_file', help='Output transformed Verilog file')
    args = parser.parse_args()

    transform_reset(args.input_file, args.output_file)