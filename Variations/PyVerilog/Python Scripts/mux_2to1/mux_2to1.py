from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    sel = vast.Ioport(vast.Input('SEL'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, sel, y])

    # Define continuous assignment: Y = SEL ? A : B
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Cond(vast.Identifier('SEL'), vast.Identifier('A'), vast.Identifier('B')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("mux_2to1", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("mux_2to1.v", "w") as f:
        f.write(rslt)

if __name__ == "__main__":
    main()