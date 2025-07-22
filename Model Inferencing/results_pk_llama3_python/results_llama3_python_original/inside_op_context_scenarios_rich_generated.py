import pyverilog.ast.tools as vtools
from pyverilog.ast import *
import re

class InsideVisitor:
    def __init__(self):
        self.changes_made = []
        self.inside_found = False
    
    def visit(self, node):
        if isinstance(node, Node):
            # Check for inside declarations
            if isinstance(node, Decl):
                for item in node.list:
                    if hasattr(item, "name") and item.name == 'inside':
                        self.inside_found = True
                        self.changes_made.append(f"Found {item.name}")
            
            # Visit children
            for c in node.children():
                self.visit(c)

def transform_inside(input_file, output_file):
    # Parse AST
    ast, directives = parse([input_file])

    # Apply visitor
    visitor = InsideVisitor()
    visitor.visit(ast)

    # Perform regex transformations
    with open(input_file, "r") as f:
        content = f.read()

    # Apply changes...
    modified_content = re.sub(r'(?<=\b)(?<!not\s)inside\b', 'case_inside', content)
    
    # Write output
    with open(output_file, "w") as f:
        f.write(modified_content)

    return True

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file')
    parser.add_argument('output_file')

    args = parser.parse_args()

    transform_inside(args.input_file, args.output_file)
    
if __name__ == '__main__':
    main()