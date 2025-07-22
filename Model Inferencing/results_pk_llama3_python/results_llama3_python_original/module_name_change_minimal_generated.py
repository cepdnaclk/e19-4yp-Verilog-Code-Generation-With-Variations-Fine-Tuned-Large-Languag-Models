import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast import *
import re


def transform_module_name(filename, oldname, newname):
    """Transform module name in a Verilog file"""
    # Parse and analyze the AST
    ast = parse(filename)
    
    # Find all modules with old name
    mod_list = [m for m in ast if isinstance(m, Module) and m.name == oldname]
    
    # Replace module names
    for m in mod_list:
        m.name = newname
        
    # Update endmodule comments if they reference the old module name
    for m in mod_list:
        comment = vtools.find_comment(m)
        if isinstance(comment, Comment):
            if re.search(r'\b' + oldname + r'\b', str(comment)):
                comment.text = re.sub(oldname, newname, str(comment))
    
    # Write the transformed file
    with open(filename, 'w') as f:
        vtools.write_ast(f, ast)
        
    return True


def main():
    """Command-line interface for module name transformation"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Transform module name in a Verilog file')
    parser.add_argument('filename', help='Verilog file to transform')
    parser.add_argument('-o', '--oldname', required=True, help='Old module name')
    parser.add_argument('-n', '--newname', required=True, help='New module name')
    
    args = parser.parse_args()
    
    if not transform_module_name(args.filename, args.oldname, args.newname):
        print('Transformation failed.')
    

if __name__ == '__main__':
    main()