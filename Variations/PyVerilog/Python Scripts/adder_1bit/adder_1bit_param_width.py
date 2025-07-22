from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define parameter
    width_param = vast.Parameter('WIDTH', vast.Rvalue(vast.IntConst('8')))
    params = vast.Paramlist([width_param])

    # Define ports with parameterized width
    width = vast.Width(vast.Minus(vast.Identifier('WIDTH'), vast.IntConst('1')), vast.IntConst('0'))
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
    ast = vast.ModuleDef("adder_1bit_param", params, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_param.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder with parameterized input/output widths. Modify the base adder_1bit.py to:

# Add a WIDTH parameter set to 8 using vast.Parameter and vast.Paramlist.
# Define ports A, B, and SUM as [WIDTH-1:0] using vast.Width with vast.Minus. Keep CIN as a single bit.
# Retain the continuous assignment SUM = A ^ B ^ CIN with nested vast.Xor for bit-wise XOR.
# Name the module adder_1bit_param and write to adder_1bit_param.v.
# Align with the test plan’s “array as a whole” and “continuous assign” themes.