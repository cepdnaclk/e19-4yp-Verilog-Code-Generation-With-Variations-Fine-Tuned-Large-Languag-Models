from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, y])

    # Define continuous assignment: Y = ~(A & B)
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.And(vast.Identifier('A'), vast.Identifier('B'))))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("nand_gate", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("nand_gate.v", "w") as f:
        f.write(rslt)

if __name__ == "__main__":
    main()
