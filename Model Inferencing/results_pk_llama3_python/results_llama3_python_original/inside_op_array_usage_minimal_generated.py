import pyverilog.ast.tools as vtools
from pyverilog.ast import *
import re


class ArrayInsideVisitor(ASTVisitor):
    def __init__(self, ast):
        self.ast = ast
        self.visited = False

    def visit(self, node):
        if isinstance(node, AstNode):
            # print("Visiting: ", type(node))
            for child in node.children:
                self.visit(child)
        elif isinstance(node, ArrayIndex) or isinstance(node, Slice):
            # print("Found array index")
            self.visited = True
            return True

    def __call__(self):
        if not self.visited:
            raise Exception("No array indexes found")


def transform(ast):
    visitor = ArrayInsideVisitor(ast)
    visitor()
    return ast


def test():
    code = """
module top;
  wire [7:0] a, b;

  assign a = {4'd1, 3'b111};
  assign b = {a[2], a[5:3]};
endmodule
"""
    ast = vtools.parse(code)
    transformed_ast = transform(ast)
    print(vtools.to_string(transformed_ast))


if __name__ == "__main__":
    test()