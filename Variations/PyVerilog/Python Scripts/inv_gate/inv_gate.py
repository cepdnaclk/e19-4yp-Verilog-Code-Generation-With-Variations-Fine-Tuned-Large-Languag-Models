from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, y])

    # Define continuous assignment: Y = ~A
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("inv_gate", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate.v", "w") as f:
        f.write(rslt)

if __name__ == "__main__":
    main()