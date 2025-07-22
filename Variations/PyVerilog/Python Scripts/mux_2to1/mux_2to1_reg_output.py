from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    sel = vast.Ioport(vast.Input('SEL'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, sel, y])

    # Define Y as reg
    y_reg = vast.Reg('Y')

    # Define combinational logic in always block
    sens_a = vast.Sens(vast.Identifier('A'), type='level')
    sens_b = vast.Sens(vast.Identifier('B'), type='level')
    sens_sel = vast.Sens(vast.Identifier('SEL'), type='level')
    senslist = vast.SensList([sens_a, sens_b, sens_sel])

    assign_y = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Cond(vast.Identifier('SEL'), vast.Identifier('A'), vast.Identifier('B')))
    )
    statement = vast.Block([assign_y])

    always = vast.Always(senslist, statement)

    # Module items
    items = [y_reg, always]

    # Module definition
    ast = vast.ModuleDef("mux_2to1_reg", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("mux_2to1_reg.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 2:1 multiplexer with a reg output and combinational logic in an always block. Modify the base mux_2to1.py to:

# Declare Y as a reg using vast.Reg.
# Replace the continuous assignment with an always block sensitive to A, B, and SEL using vast.Always and vast.SensList.
# Use non-blocking assignment (vast.NonblockingSubstitution) for Y = SEL ? A : B with vast.Cond.
# Name the module mux_2to1_reg and write to mux_2to1_reg.v.
# Ensure the script aligns with the test plan’s “always” context and “reg” data type.