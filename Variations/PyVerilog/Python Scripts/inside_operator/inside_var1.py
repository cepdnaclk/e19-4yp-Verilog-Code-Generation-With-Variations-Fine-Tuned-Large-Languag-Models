from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    x = vast.Ioport(vast.Output('X'))
    ports = vast.Portlist([a, x])

    # Define 2D array and X as reg
    width = vast.Width(vast.IntConst('7'), vast.IntConst('0'))
    dim = vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))])
    values = vast.Reg('values', width=width, dimensions=dim)
    x_reg = vast.Reg('X')

    # Initialize array in initial block
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    initial = vast.Initial(vast.Block(init_values))

    # Always_comb block for inside operator
    compare = vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst('0')))
    for i in range(1, 4):
        compare = vast.Lor(compare, vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))))
    assign_x = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('X')),
        vast.Rvalue(compare)
    )
    statement = vast.Block([assign_x])
    always = vast.AlwaysComb(None, statement)

    # Module items
    items = [values, x_reg, initial, always]

    # Module definition
    ast = vast.ModuleDef("inside_var1", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inside_var1.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module that approximates the SystemVerilog inside operator using a fixed 2D array in an always_comb block. Modify the base inside_base module to:

# Define input A as [7:0] and output X as a single-bit reg.
# Declare a 2D reg array values of size [3:0][7:0] using vast.Reg and vast.Dimensions.
# In an initial block using vast.Initial, initialize values[0] to 100, values[1] to 110, values[2] to 120, and values[3] to 130.
# In an always_comb block using vast.AlwaysComb, approximate X = A inside {values} as X <= (A == values[0]) || (A == values[1]) || (A == values[2]) || (A == values[3]) using vast.Lor, vast.Eq, and vast.NonblockingSubstitution.
# Name the module inside_var1 and write to inside_var1.v.
# Align with the test plan’s “Different types of MDAs” (fixed 2D array), “Different contexts” (always_comb), and “Cover variable initialization” themes.