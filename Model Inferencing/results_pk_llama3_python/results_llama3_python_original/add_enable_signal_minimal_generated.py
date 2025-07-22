import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import find_node_by_name
from pyverilog.ast.utils import find_nodes_by_type
from pyverilog.ast.utils import find_node_by_id

def add_enable_counter(xform):
    # Find counter increment statements (counter <= counter + 1)
    inc_stmts = find_nodes_by_type(xform, ast.Assign)

    for stmt in inc_stmts:
        if isinstance(stmt.value, ast.BinaryOp) and \
            isinstance(stmt.value.op, ast.Add) and \
            isinstance(stmt.value.left, ast.Name) and \
            stmt.value.right == 1:

            # Add enable signal as new input port
            xform.inputs.append(ast.InputPort(name='enable', direction='input'))

            # Wrap counter increments with enable condition
            if_stmt = ast.If(condition=ast.RelOp(op='==', left=stmt.value.left, right=ast.Name('enable')),
                             body=[stmt],
                             else_body=[])

            stmt.parent.replace(stmt, if_stmt)
    return True

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("filename", help="Verilog file to transform")
    args = parser.parse_args()

    with open(args.filename) as f:
        xform = parse(f.read())

    add_enable_counter(xform)

    print(xform.to_string())

if __name__ == '__main__':
    main()