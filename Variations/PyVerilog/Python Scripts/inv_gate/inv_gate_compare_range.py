from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, y])

    # Define internal array and Y as reg
    values = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                      dimensions=vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))]))
    y_reg = vast.Reg('Y')

    # Initial block to initialize array and perform range check
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    range_check = vast.Land(
        vast.GreaterEq(vast.Identifier('A'), vast.IntConst('100')),
        vast.LessEq(vast.Identifier('A'), vast.IntConst('130'))
    )
    assign_y = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(range_check)
    )
    statement = vast.Block(init_values + [assign_y])
    initial = vast.Initial(statement)

    # Module items
    items = [values, y_reg, initial]

    # Module definition
    ast = vast.ModuleDef("inv_gate_compare_range", None, ports, items)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    with open("inv_gate_compare_range.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module that checks if input A is in the range [100:130] for an inverter gate. Modify the base inv_gate.py to:

# Define port A as [7:0] and Y as a single-bit output.
# Declare a reg array values of size [3:0][7:0] and Y as reg using vast.Reg.
# In an initial block using vast.Initial:
# Initialize values[0] to 100, values[1] to 110, values[2] to 120, and values[3] to 130 using vast.BlockingSubstitution.
# Assign Y = (A >= 100) && (A <= 130) using vast.Land, vast.GreaterEq, and vast.LessEq.
# Name the module inv_gate_compare_range and write to inv_gate_compare_range.v.
# Align with the test plan’s “range list” and “initial block” themes.