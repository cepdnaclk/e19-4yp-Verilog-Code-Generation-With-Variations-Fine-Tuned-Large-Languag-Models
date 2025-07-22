from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define always block with range check on array slice
    sens = vast.Sens(vast.Identifier('A'), type='level')
    senslist = vast.SensList([sens])
    range_check = vast.Land(
        vast.GreaterEq(vast.Partselect(vast.Identifier('A'), vast.IntConst('3'), vast.IntConst('0')), vast.IntConst('8')),
        vast.LessEq(vast.Partselect(vast.Identifier('A'), vast.IntConst('3'), vast.IntConst('0')), vast.IntConst('15'))
    )
    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(range_check)
    )
    statement = vast.Block([assign_y])
    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("and_gate_slice_always", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("and_gate_slice_always.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of basic_and_gate.py using Pyverilog to produce a Verilog module. The original module (and_gate) performs Y = A & B with a continuous assignment. The new script should:

# Use an 8-bit array input (A) and a 1-bit output (Y) that is set to 1 if a slice of A (e.g., A[3:0]) is within a range (e.g., [8:15]) using vast.GreaterEq, vast.LessEq, and vast.Land in an always block.
# Declare Y as a reg inside the module to support procedural assignment.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to and_gate_slice_always.v with module name and_gate_slice_always.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “array slice” and “range list” themes.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.