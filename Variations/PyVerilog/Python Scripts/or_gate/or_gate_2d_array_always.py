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
    y = vast.Ioport(vast.Output('Y', width=width, dimensions=dim))
    ports = vast.Portlist([a, b, y])

    # Define Y as reg
    y_reg = vast.Reg('Y', width=width, dimensions=dim)

    # Define always_comb block
    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Or(vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])
    always = vast.AlwaysComb(None, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("or_gate_2d_array", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("or_gate_2d_array.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of or_gate.py using Pyverilog to produce a Verilog module. The original module (or_gate) performs Y = A | B with a continuous assignment. The new script should:

# Use 4x4 2D array inputs A, B, and output Y ([3:0][3:0]) using vast.Width and vast.Dimensions, performing bit-wise OR with vast.Or in an always_comb block using vast.AlwaysComb.
# Declare Y as a reg inside the module with vast.Reg.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to or_gate_2d_array.v with module name or_gate_2d_array.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “Different types of MDAs” and “always_comb” themes.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.