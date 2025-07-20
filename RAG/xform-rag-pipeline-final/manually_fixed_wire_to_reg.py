#!/usr/bin/env python3
import sys
import os
import re
import argparse
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *


class TransformationVisitor:
    def __init__(self, signal=None, width=None):
        self.signal = signal
        self.width = width
        self.changes_made = []
        self.wire_signals = []

    def visit(self, node):
        if isinstance(node, Decl):
            for child in node.children():
                if isinstance(child, Wire):
                    signal_name = str(child.name)
                    self.wire_signals.append(signal_name)
                    if not self.signal or signal_name == self.signal:
                        self.changes_made.append(
                            f"Found wire '{signal_name}' to convert"
                        )

        if isinstance(node, Node):
            for child in node.children():
                self.visit(child)


def transform_operation(input_file, output_file, signal=None, width=None):
    try:
        with open(input_file, "r") as f:
            content = f.read()

        ast, directives = parse([input_file])
        visitor = TransformationVisitor(signal, width)
        visitor.visit(ast)

        modified_content = content

        if signal:
            # Convert specific signal
            pattern = r"\bwire\s+" + re.escape(signal) + r"\b"
            replacement = f"reg {signal}"
            modified_content = re.sub(pattern, replacement, modified_content)
            print(f"Converted wire '{signal}' to reg")
        else:
            # Convert all wires found by visitor
            for wire_name in visitor.wire_signals:
                pattern = r"\bwire\s+" + re.escape(wire_name) + r"\b"
                replacement = f"reg {wire_name}"
                modified_content = re.sub(pattern, replacement, modified_content)
            print(f"Converted {len(visitor.wire_signals)} wires to regs")

        with open(output_file, "w") as f:
            f.write(modified_content)
        return True

    except Exception as e:
        print(f"Error: {e}")
        return False


def main():
    parser = argparse.ArgumentParser(description="Wire to reg conversion")
    parser.add_argument("input_file", help="Input Verilog file")
    parser.add_argument("output_file", help="Output Verilog file")
    parser.add_argument("--signal", help="Specific signal name to convert")

    args = parser.parse_args()
    if not os.path.exists(args.input_file):
        print(f"Error: Input file not found: {args.input_file}")
        return 1

    success = transform_operation(
        args.input_file, args.output_file, args.signal, getattr(args, "width", None)
    )
    return 0 if success else 1


if __name__ == "__main__":
    sys.exit(main())
