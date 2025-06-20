# Generated by Ollama Llama 3
# Task: inside_op_xmr_scenarios_rich
# Attempt: 1
# Success: False
# Overall Score: 0.585

import argparse
import re
from pyverilog.ast import *
from pyverilog.ast.utils.visitor import Visitor
from pyverilog.vexpr import exprutils

def _find_reference(node, signal_name):
    if isinstance(node, Decl):
        for item in node.list:
            if hasattr(item, "name") and item.name == signal_name:
                return True

    if isinstance(node, Node):
        # Check for target declarations
        if isinstance(node, Decl):
            for item in node.list:
                if hasattr(item, "name") and item.name == self.signal_name:
                    self.signal_found = True
                    self.changes_made.append(f"Found {self.signal_name}")

    # Visit children
    for c in node.children():
        _find_reference(c, signal_name)

def find_inside_reference(module_list):
    """ Find the references of inside operator with cross-module.

    Args:
        module_list (list): List of modules.
    
    Returns:
        dict: Dictionary containing all references. 
    """
    ref_dict = {}
    for mod in module_list:
        _find_reference(mod, 'ref')
        
        # Extract all instances
        instance_list = [i for i in mod.children() if isinstance(i, Instance)]
        for inst in instance_list:
            if isinstance(inst.portlist, PortList):
                port_list = inst.portlist.list 
                for port in port_list:
                    if isinstance(port, SignalRef) and hasattr(port.ref, 'name') and port.ref.name == 'ref':
                        ref_dict[mod.name] = [inst.name]
    
    return ref_dict


def transform_inside_reference(input_file, output_file):
    # Parse AST
    ast, directives = parse([input_file])

    # Find all references of inside operator with cross-module references
    reference_list = find_inside_reference(ast)

    modified_content = re.sub(r'(?<=ref\()(\w+)', r'\1', input_file)
    
    # Write output file
    with open(output_file, "w") as f:
        f.write(modified_content)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file', help='Input verilog file')
    parser.add_argument('--output_file', default=None,
                        help='Output verilog file (default: <input_file>_modified)')
    args = parser.parse_args()

    if not args.output_file:
        args.output_file = args.input_file + '_modified'

    transform_inside_reference(args.input_file, args.output_file)