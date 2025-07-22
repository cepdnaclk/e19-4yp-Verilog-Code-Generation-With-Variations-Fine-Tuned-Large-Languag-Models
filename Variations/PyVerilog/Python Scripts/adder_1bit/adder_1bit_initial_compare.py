from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    sum = vast.Ioport(vast.Output('SUM'))
    ports = vast.Portlist([a, sum])

    # Define internal array and SUM as reg
    values = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))]))
    sum_reg = vast.Reg('SUM')

    # Initial block to initialize array and compare
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    compare = vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst('0')))
    for i in range(1, 4):
        compare = vast.Lor(compare, vast.Eq(vast.Identifier('A'), vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))))
    assign_sum = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(compare)
    )
    statement = vast.Block(init_values + [assign_sum])
    initial = vast.Initial(statement)

    # Module items
    items = [values, sum_reg, initial]

    # Module definition
    ast = vast.ModuleDef("adder_1bit_compare", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("adder_1bit_compare.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module that simulates an inside operator for a 1-bit adder by comparing input A to array values. Modify the base adder_1bit.py to:

# Define port A as [7:0] and SUM as a single-bit output. Remove B and CIN ports.
# Declare a reg array values of size [3:0][7:0] and SUM as reg using vast.Reg.
# In an initial block using vast.Initial:
# Initialize values[0] to 100, values[1] to 110, values[2] to 120, and values[3] to 130 using vast.BlockingSubstitution.
# Assign SUM = (A == values[0]) || (A == values[1]) || (A == values[2]) || (A == values[3]) using vast.Lor and vast.Eq.
# Name the module adder_1bit_compare and write to adder_1bit_compare.v.
# Align with the test plan’s “range list”, “initial block”, and “variable initialization” themes.
# Expected Verilog Output: