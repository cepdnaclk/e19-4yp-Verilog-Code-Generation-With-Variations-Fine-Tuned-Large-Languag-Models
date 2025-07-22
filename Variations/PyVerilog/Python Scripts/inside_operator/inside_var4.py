from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    x = vast.Ioport(vast.Output('X'))
    ports = vast.Portlist([a, x])

    # Define array and X as reg
    values = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('5'), vast.IntConst('0'))]))
    x_reg = vast.Reg('X')

    # Initialize array
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(6)
    ]
    initial = vast.Initial(vast.Block(init_values))

    # If statement with array slice
    compare = vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst('1')))
    for i in range(2, 4):
        compare = vast.Lor(compare, vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))))
    assign_x = vast.NonblockingSubstitution(vast.Lvalue(vast.Identifier('X')), vast.IntConst('1'))
    else_x = vast.NonblockingSubstitution(vast.Lvalue(vast.Identifier('X')), vast.IntConst('0'))
    if_stmt = vast.IfStatement(compare, vast.Block([assign_x]), vast.Block([else_x]))
    always = vast.AlwaysComb(None, vast.Block([if_stmt]))

    # Module items
    items = [values, x_reg, initial, always]

    # Module definition
    ast = vast.ModuleDef("inside_var4", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inside_var4.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()
