import pyverilog.ast.tools as asttools
from pyverilog.parser import parse
from pyverilog.ast.utils.visitor import Visitor
import re


class ChangeSignalWidth(Visitor):
    def __init__(self, old_width, new_width):
        self.old_width = old_width
        self.new_width = new_width

    def visit_declaration(self, node):
        if isinstance(node.signal, asttools.Signal) and \
                node.signal.width == self.old_width:
            node.signal.width = self.new_width
            return True
        else:
            return False


def change_signal_width(filename, old_width, new_width):
    with open(filename, 'r') as f:
        code = f.read()

    parser = parse(code)
    visitor = ChangeSignalWidth(old_width, new_width)

    if not visitor.visit(parser.ast):
        print("Failed to find signal declaration")
        return False

    # Replace the old width with the new one
    code = re.sub(r'width\s*=\s*' + str(old_width) +
                  r'\s*,\s*\n', 'width = ' + str(new_width), code)

    # Write the modified code back to the file
    with open(filename, 'w') as f:
        f.write(code)
    return True


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    parser.add_argument('--old_width', type=int, required=True)
    parser.add_argument('--new_width', type=int, required=True)

    args = parser.parse_args()

    if not change_signal_width(args.filename, args.old_width,
                               args.new_width):
        print("Failed to modify the file")