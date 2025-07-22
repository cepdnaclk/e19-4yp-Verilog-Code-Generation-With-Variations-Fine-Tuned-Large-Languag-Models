import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils import find_node_by_name
from pyverilog.ast.utils import find_nodes_by_type
from pyverilog.ast.utils import find_node_by_id
from pyverilog.ast.utils import find_node_by_lineno
import re

def change_base_type(ast, old_type, new_type):
    # Find all array declarations with the given base type
    arr_decls = find_nodes_by_type(ast, 'ArrayDecl')
    for decl in arr_decls:
        if decl.baseType == old_type:
            # Replace the base type and handle width specifications appropriately
            decl.baseType = new_type
            if decl.width is not None:
                decl.width = re.sub(old_type, new_type, str(decl.width))
            return True

    return False

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='Verilog file to transform')
    args = parser.parse_args()

    # Parse the Verilog file
    ast = parse(args.filename)

    # Find all array declarations with the given base type
    arr_decls = find_nodes_by_type(ast, 'ArrayDecl')

    for decl in arr_decls:
        if change_base_type(decl, 'bit', 'logic'):
            print('Changed base type of array declaration from bit to logic')
        elif change_base_type(decl, 'int', 'byte'):
            print('Changed base type of array declaration from int to byte')
        else:
            print('No changes made')

if __name__ == '__main__':
    main()