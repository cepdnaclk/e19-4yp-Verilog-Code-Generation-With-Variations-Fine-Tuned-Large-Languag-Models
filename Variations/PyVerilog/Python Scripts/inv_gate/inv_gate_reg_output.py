from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define combinational logic in always block
    sens_a = vast.Sens(vast.Identifier('A'), type='level')
    senslist = vast.SensList([sens_a])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("inv_gate_reg", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate_reg.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an inverter gate with a reg output and combinational logic in an always block. Modify the base inv_gate.py to:

# Declare Y as a reg using vast.Reg.
# Replace the continuous assignment with an always block sensitive to A using vast.Always and vast.SensList.
# Use non-blocking assignment (vast.NonblockingSubstitution) for Y = ~A with vast.Unot.
# Name the module inv_gate_reg and write to inv_gate_reg.v.
# Ensure the script aligns with the test plan’s “always” context and “reg” data type.