from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM'))
    ports = vast.Portlist([a, b, cin, sum])

    # Define SUM as reg
    sum_reg = vast.Reg('SUM')

    # Define combinational logic in always block
    sens_a = vast.Sens(vast.Identifier('A'), type='level')
    sens_b = vast.Sens(vast.Identifier('B'), type='level')
    sens_cin = vast.Sens(vast.Identifier('CIN'), type='level')
    senslist = vast.SensList([sens_a, sens_b, sens_cin])

    assign_sum = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )
    statement = vast.Block([assign_sum])

    always = vast.Always(senslist, statement)

    # Module items
    items = [sum_reg, always]

    # Module definition
    ast = vast.ModuleDef("adder_1bit_reg", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_reg.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder with a reg output and combinational logic in an always block. Modify the base adder_1bit.py to:

# Declare SUM as a reg using vast.Reg.
# Replace the continuous assignment with an always block sensitive to A, B, and CIN using vast.Always and vast.SensList.
# Use non-blocking assignment (vast.NonblockingSubstitution) for SUM = A ^ B ^ CIN with nested vast.Xor.
# Name the module adder_1bit_reg and write to adder_1bit_reg.v.
# Ensure the script aligns with the test plan’s “always” context and “reg” data type.