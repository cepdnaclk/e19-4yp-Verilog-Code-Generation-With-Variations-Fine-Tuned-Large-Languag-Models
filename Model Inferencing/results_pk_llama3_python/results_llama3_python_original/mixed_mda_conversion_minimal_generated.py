import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from pyverilog.ast.tools import *
import re

class ArrayToMixedMDA(ast.NodeVisitor):
    def __init__(self, filename):
        self.filename = filename
        self.ast = None
    
    def visit(self, node):
        if isinstance(node, ast.ArrayDecl):
            # Parse the array declaration and get its dimensions
            dims = []
            for dim in node.dimensions:
                if isinstance(dim, ast.Dimension):
                    dims.append(dim)
            
            # Check if the array is a mixed MDA type
            mda_type = self.check_mixed_mda(dims)
            if mda_type == 'fixed':
                # Convert to fixed MDA syntax
                node.dimensions = [ast.FixedDimension()]
            elif mda_type == 'dynamic':
                # Convert to dynamic MDA syntax
                node.dimensions = [ast.DynamicDimension()]
            elif mda_type == 'associative':
                # Convert to associative MDA syntax
                node.dimensions = [ast.AssociativeDimension()]
            else:
                raise ValueError('Invalid mixed MDA type')
        
        return super().visit(node)
    
    def check_mixed_mda(self, dims):
        # Check if the array is a mixed MDA type
        mda_type = None
        
        for dim in dims:
            if isinstance(dim, ast.FixedDimension):
                mda_type = 'fixed'
            elif isinstance(dim, ast.DynamicDimension):
                mda_type = 'dynamic'
            elif isinstance(dim, ast.AssociativeDimension):
                mda_type = 'associative'
        
        return mda_type
    
    def transform(self):
        # Parse the Verilog file
        self.ast = parse(self.filename)
        
        # Create a visitor object and apply it to the AST
        visitor = ArrayToMixedMDA(self.filename)
        visitor.visit(self.ast)
        
        # Write the transformed code back to the original file
        with open(self.filename, 'w') as f:
            f.write(str(self.ast))
    
    def main():
        parser = argparse.ArgumentParser()
        parser.add_argument('filename', help='Verilog file to transform')
        args = parser.parse_args()
        
        ArrayToMixedMDA(args.filename).transform()

if __name__ == '__main__':
    ArrayToMixedMDA.main()