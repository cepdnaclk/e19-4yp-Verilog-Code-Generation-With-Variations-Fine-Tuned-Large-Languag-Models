from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    clk = vast.Ioport(vast.Input('CLK'))
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))  # Output Y, will be reg in module
    ports = vast.Portlist([clk, a, b, y])

    # Define Y as reg inside module
    y_reg = vast.Reg('Y')

    # Define sequential logic in always block
    sens = vast.Sens(vast.Identifier('CLK'), type='posedge')
    senslist = vast.SensList([sens])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.And(vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("and_gate_reg_sequential", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("and_gate_reg_sequential.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script as a variation of and_gate_reg_output.py using Pyverilog to produce a Verilog module. The original module (and_gate_reg) performs Y <= A & B in an always block. The new script should:

# Convert to a sequential circuit by adding a clock input (CLK) and making the always block sensitive to posedge CLK using vast.Sens with type='posedge'.
# Retain the AND logic and reg output.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to and_gate_reg_sequential.v with module name and_gate_reg_sequential.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “always” context.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.