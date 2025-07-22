import pyverilog.ast.tools as vtools
from pyverilog.ast import *
import re


def transform(ast, signal_names, new_width):
    # Find all signals in the AST
    signals = [s for s in ast if isinstance(s, Signal)]

    # Create a visitor class to identify target elements  
    class Visitor(vtools.ASTVisitor):
        def __init__(self):
            self.signal_names = signal_names

        def visit_Signal(self, node):
            # Find the signal name
            sig_name = node.name.value

            if sig_name in self.signal_names:
                # Update the bit width specification
                node.width = new_width

    visitor = Visitor()
    visitor.visit(ast)

    return True


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Transform Verilog code')
    parser.add_argument('filename', help='Verilog file to transform')
    parser.add_argument('-s', '--signal_names', nargs='+',
                        help='List of signal names to change width')
    parser.add_argument('-w', '--new_width', type=int,
                        help='New bit width for the signals')

    args = parser.parse_args()

    with open(args.filename) as f:
        ast = vtools.parse(f.read())

    if not transform(ast, args.signal_names, args.new_width):
        print('Transformation failed')
        exit(1)

    # Write transformed code to a new file
    with open(args.filename + '.transformed', 'w') as f:
        f.write(vtools.dump(ast))


if __name__ == '__main__':
    main()