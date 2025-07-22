

"""

import pyverilog.vparser.ast as ast
from pyverilog import VerilogPreproc
from pyverilog import VerilogLexer, VerilogParser
from pyverilog.vparser.utils import VpiName
from pyverilog.vparser.visitors import VVisitor
from pyverilog.utils import VerilogTextReader
import argparse


class StructVisitor(VVisitor):
    """
    Visitor class to find signal declarations that need to be converted

    Attributes:
        signals (list of tuples): List of signal names and their types
        structs (list of tuples): List of struct/union names and their members
    """

    def __init__(self, filename):

        self.signals = []
        self.structs = []
        self._filename = filename
        self._struct_names = set()
        self._signal_names = set()
        self._struct_members = dict()
        self._struct_member_names = set()

    def visit_Struct(self, node):

        self.structs.append((node.name, node))
        self._struct_names.add(VpiName(node).lower())
        for member in node.members:
            self.visit(member)

    def visit_Union(self, node):

        self.structs.append((node.name, node))
        self._struct_names.add(VpiName(node).lower())
        for member in node.members:
            self.visit(member)

    def visit_StructMember(self, node):

        self._struct_members[VpiName(node)] = node
        self._struct_member_names.add(VpiName(node))

    def visit_Signal(self, node):

        self.signals.append((node.name, node))
        self._signal_names.add(VpiName(node).lower())


class StructConverter(object):
    """
    Class to convert signal declarations into struct/union types

    Attributes:
        signals (list of tuples): List of signal names and their types
        structs (list of tuples): List of struct/union names and their members
    """

    def __init__(self, filename):

        self._filename = filename
        self.signals = []
        self.structs = []
        self._struct_names = set()
        self._signal_names = set()
        self._struct_members = dict()
        self._struct_member_names = set()

    def convert(self):

        with VerilogPreproc(self._filename) as preproc:
            reader = VerilogTextReader(preproc.read())

            try:
                tree = VerilogParser.parse(reader, lexer=VerilogLexer)

                visitor = StructVisitor(self._filename)
                visitor.visit(tree)

                self.signals = visitor.signals
                self.structs = visitor.structs
                self._struct_names = visitor._struct_names
                self._signal_names = visitor._signal_names
                self._struct_members = visitor._struct_members
                self._struct_member_names = visitor._struct_member_names

                return True

            except Exception as e:
                print(e)

        return False


def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='Verilog file to convert')
    args = parser.parse_args()

    converter = StructConverter(args.filename)
    if not converter.convert():
        raise Exception('Conversion failed!')

    print('Signals:')
    for signal in converter.signals:
        print(signal[0], signal[1].type)

    print('\nStructs:')
    for struct in converter.structs:
        print(struct[0])


if __name__ == '__main__':
    main()
