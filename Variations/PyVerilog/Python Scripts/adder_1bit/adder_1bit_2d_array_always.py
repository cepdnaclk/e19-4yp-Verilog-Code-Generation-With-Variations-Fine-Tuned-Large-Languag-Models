from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define 2D array ports (4x4)
    width = vast.Width(vast.IntConst('3'), vast.IntConst('0'))
    dim = vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))])
    a = vast.Ioport(vast.Input('A', width=width, dimensions=dim))
    b = vast.Ioport(vast.Input('B', width=width, dimensions=dim))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM', width=width, dimensions=dim))
    ports = vast.Portlist([a, b, cin, sum])

    # Define SUM as reg
    sum_reg = vast.Reg('SUM', width=width, dimensions=dim)

    # Define always_comb block
    assign_sum = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )
    statement = vast.Block([assign_sum])
    always = vast.AlwaysComb(None, statement)

    # Module items
    items = [sum_reg, always]

    # Module definition
    ast = vast.ModuleDef("adder_1bit_2d_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_2d_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder with 4x4 2D array inputs/output in an always_comb block. Modify the base adder_1bit.py to:

# Define ports A, B, and SUM as [3:0][3:0] using vast.Width and vast.Dimensions. Keep CIN as a single bit.
# Declare SUM as a reg with matching dimensions using vast.Reg.
# Use an always_comb block with vast.AlwaysComb and non-blocking assignment (vast.NonblockingSubstitution) for SUM = A ^ B ^ CIN with nested vast.Xor.
# Name the module adder_1bit_2d_array and write to adder_1bit_2d_array.v.
# Align with the test plan’s “MDAs” and “always_comb” themes.