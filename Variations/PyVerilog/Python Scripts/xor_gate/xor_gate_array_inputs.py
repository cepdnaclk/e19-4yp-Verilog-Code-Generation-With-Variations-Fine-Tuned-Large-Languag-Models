from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports with 4-bit arrays
    width = vast.Width(vast.IntConst('3'), vast.IntConst('0'))
    a = vast.Ioport(vast.Input('A', width=width))
    b = vast.Ioport(vast.Input('B', width=width))
    y = vast.Ioport(vast.Output('Y', width=width))
    ports = vast.Portlist([a, b, y])

    # Define continuous assignment: Y = A ^ B
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Xor(vast.Identifier('A'), vast.Identifier('B')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("xor_gate_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("xor_gate_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an XOR gate with 4-bit array inputs/outputs. Modify the base xor_gate.py to:

# Define ports A, B, and Y as [3:0] using vast.Width.
# Retain the continuous assignment Y = A ^ B with vast.Xor for bit-wise XOR.
# Name the module xor_gate_array and write to xor_gate_array.v.
# Align with the test plan’s “fixed arrays” and “continuous assign” themes.