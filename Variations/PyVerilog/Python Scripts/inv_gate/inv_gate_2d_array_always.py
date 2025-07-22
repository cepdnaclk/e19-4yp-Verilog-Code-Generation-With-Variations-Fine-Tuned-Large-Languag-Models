from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define 2D array ports (4x4)
    width = vast.Width(vast.IntConst('3'), vast.IntConst('0'))
    dim = vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))])
    a = vast.Ioport(vast.Input('A', width=width, dimensions=dim))
    y = vast.Ioport(vast.Output('Y', width=width, dimensions=dim))
    ports = vast.Portlist([a, y])

    # Define Y as reg
    y_reg = vast.Reg('Y', width=width, dimensions=dim)

    # Define always_comb block
    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )
    statement = vast.Block([assign_y])
    always = vast.AlwaysComb(None, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("inv_gate_2d_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate_2d_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an inverter gate with 4x4 2D array input/output in an always_comb block. Modify the base inv_gate.py to:

# Define ports A and Y as [3:0][3:0] using vast.Width and vast.Dimensions.
# Declare Y as a reg with matching dimensions using vast.Reg.
# Use an always_comb block with vast.AlwaysComb and non-blocking assignment (vast.NonblockingSubstitution) for Y = ~A with vast.Unot.
# Name the module inv_gate_2d_array and write to inv_gate_2d_array.v.
# Align with the test plan’s “MDAs” and “always_comb” themes.