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
        vast.Rvalue(vast.Xor(vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("xor_gate_reg", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("xor_gate_reg.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an XOR gate with a reg output and combinational logic in an always block. Modify the base xor_gate.py to:

# Declare Y as a reg using vast.Reg.
# Replace the continuous assignment with an always block sensitive to A and B using vast.Always and vast.SensList.
# Use non-blocking assignment (vast.NonblockingSubstitution) for Y = A ^ B with vast.Xor.
# Name the module xor_gate_reg and write to xor_gate_reg.v.
# Ensure the script aligns with the test plan’s “always” context and “reg” data type.