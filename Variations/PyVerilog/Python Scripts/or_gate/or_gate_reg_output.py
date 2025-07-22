from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define combinational logic in always block
    sens_a = vast.Sens(vast.Identifier('A'), type='level')
    sens_b = vast.Sens(vast.Identifier('B'), type='level')
    senslist = vast.SensList([sens_a, sens_b])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Or(vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("or_gate_reg", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("or_gate_reg.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of or_gate.py using Pyverilog to produce a Verilog module. The original module (or_gate) performs Y = A | B with a continuous assignment. The new script should:

# Use an always block sensitive to inputs A and B to perform Y <= A | B using vast.Or, with output Y declared as a reg using vast.Reg.
# Retain 1-bit inputs A, B, and output Y.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to or_gate_reg.v with module name or_gate_reg.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “always” and “reg” base type themes.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.