
"""

import argparse
from pyverilog import VerilogModule, VerilogParser


class InsideOperatorVisitor(VerilogModule):
    """
    Visitor class to identify inside operator expressions in a module
    """

    def __init__(self):
        super().__init__()

        self.inside_op = []

    def visit_InsideOp(self, node):
        """
        Visit an InsideOp node and append it to the list of inside operators
        """
        self.inside_op.append(node)


def inside_op_xform(args):
    """
    Transform module to remove inside operator expressions
    """

    # Parse the Verilog file into an AST
    parser = VerilogParser()
    ast = parser.parse(args.file, args.top)

    # Create a visitor class that inherits from the pattern
    visitor = InsideOperatorVisitor()

    # Visit the AST and extract inside operators
    visitor.visit(ast)

    # Print the inside operator expressions found in the module
    print('Inside operators:')
    for op in visitor.inside_op:
        print(op)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', help='Verilog file to transform')
    parser.add_argument('--top', help='Top module name')

    args = parser.parse_args()
    inside_op_xform(args)
