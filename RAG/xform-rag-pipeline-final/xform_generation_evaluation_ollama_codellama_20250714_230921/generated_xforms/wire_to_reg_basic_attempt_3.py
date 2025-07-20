#!/usr/bin/env python3
"""
Generated Xform: wire_to_reg_basic
Task: Transform wire declarations to reg declarations
Attempt: 3
Generated: 2025-07-14T23:14:11.161922
"""

#!/usr/bin/env python3
import sys
import os
import re
from pyverilog.vparser.ast import *

class RegToWireVisitor(NodeVisitor):
    def __init__(self, target_variable=None):
        self.target_variable = target_variable
        self.changes_made = False
        self.reg_declarations = []

    def visit(self, node):
        if isinstance(node, Node):
            self.generic_visit(node)

    def visit_Decl(self, node):
        if isinstance(node, Decl) and node.type == 'reg':
            width = ''
            if node.width:
                msb = node.width.msb.value
                lsb = node.width.lsb.value
                width = f'[{msb}:{lsb}] '
            self.reg_declarations.append({'name': node.name, 'width': width})
            self.changes_made = True

    def visit_Module(self, node):
        for child in node.children():
            self.visit(child)

def transform_reg_to_wire(input_file, output_file, target_variable=None):
    ast, directives = parse([input_file])
    visitor = RegToWireVisitor(target_variable)
    visitor.visit(ast)
    if not visitor.changes_made:
        return False
    modified_content = ''
    for decl in visitor.reg_declarations:
        pattern = r'\breg\s+' + re.escape(decl['width']) + r'\b' + re.escape(decl['name']) + r'\b'
        replacement = f'wire {decl["width"]}{decl["name"]}'
        modified_content = re.sub(pattern, replacement, modified_content)
    with open(output_file, 'w') as f:
        f.write(modified_content)
    return True