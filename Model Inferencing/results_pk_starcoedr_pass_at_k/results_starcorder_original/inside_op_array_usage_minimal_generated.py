

"""

import argparse
from pyverilog import VerilogModule, VerilogParser
from pyverilog.vparser.ast import ModuleDef, PortsDeclaration, \
    InputDeclaration, OutputDeclaration, WireDeclaration, \
    AssignStatement, Identifier, Constant, Value, Operator, \
    FunctionCall, Index, Slice, PartSelect, ArraySelect


class ArrayVisitor(object):

    def __init__(self):
        self.array_list = []
        self.array_slice_list = []
        self.array_partselect_list = []
        self.array_index_list = []
        self.array_funccall_list = []

    def visit(self, node):

        if isinstance(node, ArraySelect):
            self.array_list.append(node)
            return True

        elif isinstance(node, Slice):
            self.array_slice_list.append(node)
            return True

        elif isinstance(node, PartSelect):
            self.array_partselect_list.append(node)
            return True

        elif isinstance(node, Index):
            self.array_index_list.append(node)
            return True

        elif isinstance(node, FunctionCall):
            self.array_funccall_list.append(node)
            return True

        else:
            return False


def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('input', help='Input Verilog file')
    args = parser.parse_args()

    # Parse the input Verilog file and extract the module name
    with open(args.input, 'r') as f:
        verilog_code = f.read()

    vparser = VerilogParser()
    ast = vparser.parse(verilog_code)

    # Create a visitor instance to find array elements in the AST
    visitor = ArrayVisitor()
    visitor.visit(ast)

    # Print the results of the visitor
    print('Array Selects: {}'.format(visitor.array_list))
    print('Array Slices: {}'.format(visitor.array_slice_list))
    print('Array PartSelects: {}'.format(visitor.array_partselect_list))
    print('Array Indexs: {}'.format(visitor.array_index_list))
    print('Array FuncCalls: {}'.format(visitor.array_funccall_list))


if __name__ == '__main__':

    main()
