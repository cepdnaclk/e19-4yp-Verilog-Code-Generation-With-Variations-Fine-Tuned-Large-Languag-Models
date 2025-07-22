from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports with 4-bit arrays
    width = vast.Width(vast.IntConst('3'), vast.IntConst('0'))
    a = vast.Ioport(vast.Input('A', width=width))
    b = vast.Ioport(vast.Input('B', width=width))
    sel = vast.Ioport(vast.Input('SEL'))
    y = vast.Ioport(vast.Output('Y', width=width))
    ports = vast.Portlist([a, b, sel, y])

    # Define continuous assignment: Y = SEL ? A : B
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Cond(vast.Identifier('SEL'), vast.Identifier('A'), vast.Identifier('B')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("mux_2to1_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("mux_2to1_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 2:1 multiplexer with 4-bit array inputs/outputs. Modify the base mux_2to1.py to:

# Define ports A, B, and Y as [3:0] using vast.Width. Keep SEL as a single bit.
# Retain the continuous assignment Y = SEL ? A : B with vast.Cond.
# Name the module mux_2to1_array and write to mux_2to1_array.v.
# Align with the test plan’s “fixed arrays” and “continuous assign” themes.