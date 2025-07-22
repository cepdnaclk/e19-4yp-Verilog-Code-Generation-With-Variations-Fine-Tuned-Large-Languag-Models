from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    clk = vast.Ioport(vast.Input('CLK'))
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([clk, a, b, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define sequential logic in always block
    sens = vast.Sens(vast.Identifier('CLK'), type='posedge')
    senslist = vast.SensList([sens])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Or(vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("or_gate_reg_sequential", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("or_gate_reg_sequential.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of or_gate.py using Pyverilog to produce a Verilog module. The original module (or_gate) performs Y = A | B with a continuous assignment. The new script should:

# Add a clock input CLK and use an always block sensitive to posedge CLK with vast.Sens(type='posedge') to perform Y <= A | B using vast.Or.
# Retain 1-bit inputs A, B, and output Y, declaring Y as reg with vast.Reg.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to or_gate_reg_sequential.v with module name or_gate_reg_sequential.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “always” and “reg” base type themes for sequential logic.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.