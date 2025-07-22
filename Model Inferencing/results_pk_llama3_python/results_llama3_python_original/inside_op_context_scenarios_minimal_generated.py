import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils.visitor import Visitor
import re

def transform_inside(ast):
    visitor = InsideVisitor()
    ast.visit(visitor)
    return visitor.transformed

class InsideVisitor(Visitor):

    def __init__(self):
        self.transformed = False

    def visit_if(self, node):
        if node.cond:
            cond = node.cond
            if isinstance(cond, vtools.Logical) and cond.op == 'inside':
                # Replace inside with a new operator
                cond.op = 'in'
                self.transformed = True

    def visit_case(self, node):
        if node.cases:
            for case in node.cases:
                if case.cond:
                    cond = case.cond
                    if isinstance(cond, vtools.Logical) and cond.op == 'inside':
                        # Replace inside with a new operator
                        cond.op = 'in'
                        self.transformed = True

    def visit_always(self, node):
        if node.always_type == 'always_comb' or node.always_type == 'always_ff':
            for assign in node.assigns:
                if isinstance(assign.rhs, vtools.Logical) and assign.rhs.op == 'inside':
                    # Replace inside with a new operator
                    assign.rhs.op = 'in'
                    self.transformed = True

    def visit_loop(self, node):
        if node.loop_type == 'for' or node.loop_type == 'while':
            for cond in node.cond:
                if isinstance(cond, vtools.Logical) and cond.op == 'inside':
                    # Replace inside with a new operator
                    cond.op = 'in'
                    self.transformed = True

    def visit_initial(self, node):
        if node.initial:
            for assign in node.initial:
                if isinstance(assign.rhs, vtools.Logical) and assign.rhs.op == 'inside':
                    # Replace inside with a new operator
                    assign.rhs.op = 'in'
                    self.transformed = True

    def visit_final(self, node):
        if node.final:
            for assign in node.final:
                if isinstance(assign.rhs, vtools.Logical) and assign.rhs.op == 'inside':
                    # Replace inside with a new operator
                    assign.rhs.op = 'in'
                    self.transformed = True

    def visit_case_inside(self, node):
        if node.cases:
            for case in node.cases:
                if isinstance(case.cond, vtools.Logical) and case.cond.op == 'inside':
                    # Replace inside with a new operator
                    case.cond.op = 'in'
                    self.transformed = True

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='Verilog file to transform')
    args = parser.parse_args()

    with open(args.filename) as f:
        verilog_code = f.read()

    ast = parse(verilog_code)
    transformed_ast = transform_inside(ast)

    if transformed_ast:
        print("Transformation successful!")
    else:
        print("No transformations found.")