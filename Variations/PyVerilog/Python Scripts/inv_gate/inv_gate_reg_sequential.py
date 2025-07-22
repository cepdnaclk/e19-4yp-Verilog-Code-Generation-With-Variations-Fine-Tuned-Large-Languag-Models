from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    clk = vast.Ioport(vast.Input('CLK'))
    a = vast.Ioport(vast.Input('A'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([clk, a, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define sequential logic in always block
    sens = vast.Sens(vast.Identifier('CLK'), type='posedge')
    senslist = vast.SensList([sens])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("inv_gate_reg_sequential", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate_reg_sequential.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an inverter gate with sequential logic triggered by a clock. Modify the base inv_gate.py to:

# Add a CLK input port using vast.Ioport.
# Declare Y as a reg using vast.Reg.
# Use an always block sensitive to posedge CLK with vast.Always, vast.Sens, and vast.SensList.
# Assign Y = ~A using non-blocking assignment (vast.NonblockingSubstitution) with vast.Unot.
# Name the module inv_gate_reg_sequential and write to inv_gate_reg_sequential.v.
# Align with the test plan’s “always” context for sequential logic.