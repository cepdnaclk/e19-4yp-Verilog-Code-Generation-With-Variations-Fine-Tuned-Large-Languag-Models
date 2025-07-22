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
    y = vast.Ioport(vast.Output('Y', width=width))
    ports = vast.Portlist([a, y])

    # Define continuous assignment: Y = ~A
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("inv_gate_param", params, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate_param.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an inverter gate with parameterized input/output widths. Modify the base inv_gate.py to:

# Add a WIDTH parameter set to 8 using vast.Parameter and vast.Paramlist.
# Define ports A and Y as [WIDTH-1:0] using vast.Width with vast.Minus.
# Retain the continuous assignment Y = ~A with vast.Unot for bit-wise NOT.
# Name the module inv_gate_param and write to inv_gate_param.v.
# Align with the test plan’s “array as a whole” and “continuous assign” themes.