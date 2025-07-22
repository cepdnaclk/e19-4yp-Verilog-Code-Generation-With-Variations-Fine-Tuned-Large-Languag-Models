from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports with 4-bit arrays
    width = vast.Width(vast.IntConst('3'), vast.IntConst('0'))
    a = vast.Ioport(vast.Input('A', width=width))
    b = vast.Ioport(vast.Input('B', width=width))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM', width=width))
    ports = vast.Portlist([a, b, cin, sum])

    # Define continuous assignment: SUM = A ^ B ^ CIN
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("adder_1bit_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder with 4-bit array inputs/output. Modify the base adder_1bit.py to:

# Define ports A, B, and SUM as [3:0] using vast.Width. Keep CIN as a single bit.
# Retain the continuous assignment SUM = A ^ B ^ CIN with nested vast.Xor for bit-wise XOR.
# Name the module adder_1bit_array and write to adder_1bit_array.v.
# Align with the test plan’s “fixed arrays” and “continuous assign” themes.