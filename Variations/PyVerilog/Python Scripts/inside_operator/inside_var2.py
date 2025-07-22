from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    x = vast.Ioport(vast.Output('X'))
    ports = vast.Portlist([a, x])

    # Define dynamic array, X, i, and found as reg
    values = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))]))
    x_reg = vast.Reg('X')
    i_reg = vast.Reg('i', width=vast.Width(vast.IntConst('31'), vast.IntConst('0')))
    found_reg = vast.Reg('found')

    # Initialize array
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    initial = vast.Initial(vast.Block(init_values))

    # For loop to check inside
    compare = vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.Identifier('i')))
    assign_x = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('X')),
        vast.Rvalue(vast.IntConst('1'))
    )
    assign_found = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('found')),
        vast.Rvalue(vast.IntConst('1'))
    )
    if_stmt = vast.IfStatement(compare, vast.Block([assign_x, assign_found]), None)
    for_stmt = vast.ForStatement(
        vast.BlockingSubstitution(vast.Lvalue(vast.Identifier('i')), vast.IntConst('0')),
        vast.Land(vast.LessThan(vast.Identifier('i'), vast.IntConst('4')), vast.Eq(vast.Identifier('found'), vast.IntConst('0'))),
        vast.BlockingSubstitution(vast.Lvalue(vast.Identifier('i')), vast.Plus(vast.Identifier('i'), vast.IntConst('1'))),
        vast.Block([if_stmt])
    )
    assign_x_zero = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('X')),
        vast.Rvalue(vast.IntConst('0'))
    )
    assign_found_zero = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('found')),
        vast.Rvalue(vast.IntConst('0'))
    )
    # Define sensitivity list for always @*
    sens_list = vast.SensList([vast.Sens(vast.Identifier('*'))])
    always = vast.Always(sens_list, vast.Block([assign_x_zero, assign_found_zero, for_stmt]))

    # Module items
    items = [values, x_reg, i_reg, found_reg, initial, always]

    # Module definition
    ast = vast.ModuleDef("inside_var2", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inside_var2.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()