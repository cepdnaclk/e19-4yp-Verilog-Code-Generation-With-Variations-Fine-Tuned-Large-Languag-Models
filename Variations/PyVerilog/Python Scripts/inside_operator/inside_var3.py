from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    x = vast.Ioport(vast.Output('X'))
    ports = vast.Portlist([a, x])

    # Define array with negative range and X as reg
    values = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('1'), vast.IntConst('-2'))]))
    x_reg = vast.Reg('X')

    # Initialize array
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i - 2)))),
            vast.Rvalue(vast.IntConst(str(100 + (i - 2) * 10)))
        ) for i in range(4)
    ]
    initial = vast.Initial(vast.Block(init_values))

    # Continuous assignment for inside
    compare = vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst('-2')))
    for i in range(-1, 2):
        compare = vast.Lor(compare, vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))))
    assign = vast.Assign(vast.Lvalue(vast.Identifier('X')), vast.Rvalue(compare))

    # Module items
    items = [values, x_reg, initial, assign]

    # Module definition
    ast = vast.ModuleDef("inside_var3", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inside_var3.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()