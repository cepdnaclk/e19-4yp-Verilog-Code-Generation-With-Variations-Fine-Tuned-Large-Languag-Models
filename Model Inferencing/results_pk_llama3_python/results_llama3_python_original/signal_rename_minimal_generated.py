import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils import findall
from pyverilog.ast.utils import findall_by_type
from pyverilog.ast.utils import findall_by_name
from pyverilog.ast.utils import findall_by_attribute

def rename_signal(old_name, new_name):
    # Parse the Verilog file
    ast = parse('test.v')
    
    # Find all occurrences of old_name in declarations, assignments and references
    decls = findall_by_type(ast, 'Decl', lambda node: node.name == old_name)
    assigns = findall_by_attribute(ast, 'Assign', 'lhs', lambda node: node.value == old_name)
    refs = findall_by_attribute(ast, 'Reference', 'name', lambda node: node.value == old_name)

    # Replace all occurrences of old_name with new_name
    for decl in decls:
        decl.name = new_name
    for assign in assigns:
        assign.lhs.value = new_name
    for ref in refs:
        ref.name = new_name

    return ast