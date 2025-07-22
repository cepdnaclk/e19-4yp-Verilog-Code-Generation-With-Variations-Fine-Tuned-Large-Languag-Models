import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils.visitor import Visitor, visit
from re import sub
import argparse


class WireToReg(Visitor):
    def __init__(self):
        self.wire_list = []

    def visit_wire(self, node):
        # Get the wire name and bit width
        name = node.name
        width = node.width

        # Add to list of wires
        self.wire_list.append((name, width))

        # Replace 'wire' with 'reg'
        node.type = "reg"

    def visit_wire_declaration(self, node):
        # Get the wire declarations
        for decl in node.declarations:
            if isinstance(decl, vtools.WireDeclaration):
                visit(decl)

    def transform(self, filename):
        # Parse Verilog file and get AST
        ast = parse(filename).ast

        # Find all wires
        visit(ast)

        # Replace 'wire' with 'reg'
        for name, width in self.wire_list:
            pattern = r"wire\s*\(.*\)\s*" + name + "\(\d*\)"
            new_pattern = "reg " + name + "(" + str(width) + ")"
            ast = sub(pattern, new_pattern, str(ast))

        # Write transformed file
        with open(filename, 'w') as f:
            f.write(str(ast))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("filename", help="Verilog file to transform")
    args = parser.parse_args()

    transformer = WireToReg()
    result = transformer.transform(args.filename)
    if not result:
        print("Transformation failed")


if __name__ == "__main__":
    main()