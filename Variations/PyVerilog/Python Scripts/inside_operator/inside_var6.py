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
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))]))
    x_reg = vast.Reg('X')

    # Initialize array
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    initial = vast.Initial(vast.Block(init_values))

    # Case inside statement (approximated)
    assign_x_1 = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('X')),
        vast.Rvalue(vast.IntConst('1'))
    )
    assign_x_0 = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('X')),
        vast.Rvalue(vast.IntConst('0'))
    )
    case_items = [
        vast.Case(
            vast.Rvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Block([assign_x_1])
        ) for i in range(4)
    ]
    case_items.append(vast.Case(None, vast.Block([assign_x_0])))
    case_stmt = vast.CaseStatement(vast.Identifier('A'), case_items)
    always = vast.AlwaysComb(vast.Block([case_stmt]))

    # Module items
    items = [values, x_reg, initial, always]

    # Module definition
    ast = vast.ModuleDef("inside_var6", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inside_var6.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()