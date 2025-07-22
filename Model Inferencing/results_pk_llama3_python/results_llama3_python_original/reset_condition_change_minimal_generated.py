import pyverilog.ast.tools as vtools
from pyverilog.parser import parse
from pyverilog.ast.utils import find_nodes_by_type
from pyverilog.ast.utils import find_node_by_name
from pyverilog.ast.utils import find_node_by_attribute
from pyverilog.ast.utils import find_node_by_attribute_value
import re

def reset_condition_transform(ast):
    # Find all if statements with a reset condition
    if_stmts = find_nodes_by_type(ast, 'IfStmt')
    
    for stmt in if_stmts:
        # Check if the if statement has a reset condition
        if (find_node_by_attribute(stmt, 'condition', 'reset')):
            # Get the reset signal name
            reset_signal_name = find_node_by_attribute_value(
                stmt,
                'condition',
                'reset'
            )
            
            # Change the reset condition from active-high to active-low or vice versa
            if (find_node_by_attribute_value(stmt, 'condition', 'active_low')):
                new_condition = 'if (!' + reset_signal_name + ')'
            else:
                new_condition = 'if (' + reset_signal_name + ')'
            
            # Update the sensitivity list
            if (find_node_by_attribute_value(stmt, 'sensitivity_list', 'posedge')):
                new_sensitivity_list = ['negedge ' + reset_signal_name]
            else:
                new_sensitivity_list = ['posedge ' + reset_signal_name]
                
            # Replace the old condition with the new one
            stmt.condition = vtools.parse(new_condition)
            
            # Update the sensitivity list
            stmt.sensitivity_list = [vtools.parse(x) for x in new_sensitivity_list]
    
    return ast

def main():
    import argparse
    
    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='Verilog file to transform')
    args = parser.parse_args()
    
    with open(args.filename, 'r') as f:
        verilog_code = f.read()
        
    # Parse the Verilog code
    ast = parse(verilog_code)
    
    # Transform the AST
    transformed_ast = reset_condition_transform(ast)
    
    # Print the transformed code
    print(transformed_ast.to_string())

if __name__ == '__main__':
    main()