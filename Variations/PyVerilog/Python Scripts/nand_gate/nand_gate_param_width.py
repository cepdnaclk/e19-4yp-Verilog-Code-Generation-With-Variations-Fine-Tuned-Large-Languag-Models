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

    # Define continuous assignment: Y = ~(A & B)
    assign = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.And(vast.Identifier('A'), vast.Identifier('B'))))
    )

    # Module items
    items = [assign]

    # Module definition
    ast = vast.ModuleDef("nand_gate_param", params, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("nand_gate_param.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of nand_gate.py using Pyverilog to produce a Verilog module. The original module (nand_gate) performs Y = ~(A & B) with a continuous assignment. The new script should:

# Add a WIDTH parameter (default 8) using vast.Parameter and apply it to inputs A, B, and output Y using vast.Width, performing bit-wise NAND with vast.Unot and vast.And.
# Retain the continuous assignment structure.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to nand_gate_param.v with module name nand_gate_param.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “array as a whole” and “logic-vector” base type themes.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.