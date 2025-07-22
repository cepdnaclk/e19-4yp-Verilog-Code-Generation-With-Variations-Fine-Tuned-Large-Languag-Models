from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    clk = vast.Ioport(vast.Input('CLK'))
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM'))
    ports = vast.Portlist([clk, a, b, cin, sum])

    # Define SUM as reg
    sum_reg = vast.Reg('SUM')

    # Define sequential logic in always block
    sens = vast.Sens(vast.Identifier('CLK'), type='posedge')
    senslist = vast.SensList([sens])

    assign_sum = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )
    statement = vast.Block([assign_sum])

    always = vast.Always(senslist, statement)

    # Module items
    items = [sum_reg, always]

    # Module definition
    ast = vast.ModuleDef("adder_1bit_reg_sequential", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_reg_sequential.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder with sequential logic triggered by a clock. Modify the base adder_1bit.py to:

# Add a CLK input port using vast.Ioport.
# Declare SUM as a reg using vast.Reg.
# Use an always block sensitive to posedge CLK with vast.Always, vast.Sens, and vast.SensList.
# Assign SUM = A ^ B ^ CIN using non-blocking assignment (vast.NonblockingSubstitution) with nested vast.Xor.
# Name the module adder_1bit_reg_sequential and write to adder_1bit_reg_sequential.v.
# Align with the test plan’s “always” context for sequential logic.