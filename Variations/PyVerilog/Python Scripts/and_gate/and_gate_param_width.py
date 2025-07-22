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
    y = vast.Ioport(vast.Output('Y', width=width))
    ports = vast.Portlist([a, b, y])

    # Define continuous assignment: Y = A & B
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.And(vast.Identifier('A'), vast.Identifier('B')))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("and_gate_param", params, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("and_gate_param.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of and_gate_param_width.py using Pyverilog to produce a Verilog module. The original module (and_gate_param) performs Y = A & B on 8-bit inputs with a WIDTH parameter. The new script should:

# Implement a reduction AND (e.g., Y[0] = &A) using vast.Uand to produce a 1-bit output.
# Retain the parameterized input width and continuous assignment.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to and_gate_reduction.v with module name and_gate_reduction.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “Various operand types” theme.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.