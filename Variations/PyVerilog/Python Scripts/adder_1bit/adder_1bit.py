from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM'))
    ports = vast.Portlist([a, b, cin, sum])

    # Define continuous assignment: SUM = A ^ B ^ CIN
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("adder_1bit", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit.v", "w") as f:
        f.write(rslt)

if __name__ == "__main__":
    main()