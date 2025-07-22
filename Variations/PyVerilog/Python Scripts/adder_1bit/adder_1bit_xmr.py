from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports for sub_adder module
    a_sub = vast.Ioport(vast.Input('A'))
    b_sub = vast.Ioport(vast.Input('B'))
    cin_sub = vast.Ioport(vast.Input('CIN'))
    sum_sub = vast.Ioport(vast.Output('Z'))
    ports_sub = vast.Portlist([a_sub, b_sub, cin_sub, sum_sub])

    # Define sub_adder module (Z = A ^ B ^ CIN)
    assign_z = vast.Assign(
        vast.Lvalue(vast.Identifier('Z')),
        vast.Rvalue(vast.Xor(vast.Xor(vast.Identifier('A'), vast.Identifier('B')), vast.Identifier('CIN')))
    )
    items_sub = [assign_z]
    sub_adder = vast.ModuleDef("sub_adder", None, ports_sub, items_sub)

    # Define ports for main module
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    cin = vast.Ioport(vast.Input('CIN'))
    sum = vast.Ioport(vast.Output('SUM'))
    ports = vast.Portlist([a, b, cin, sum])

    # Instantiate sub_adder module
    inst = vast.Instance(
        module='sub_adder',
        name='inst',
        parameterlist=[],
        portlist=[
            vast.PortArg('A', vast.Identifier('A')),
            vast.PortArg('B', vast.Identifier('B')),
            vast.PortArg('CIN', vast.Identifier('CIN')),
            vast.PortArg('Z', vast.Identifier('Z'))
        ]
    )
    inst_list = vast.InstanceList('sub_adder', [], [inst])

    # Define continuous assignment: SUM = Z
    assign_sum = vast.Assign(
        vast.Lvalue(vast.Identifier('SUM')),
        vast.Rvalue(vast.Identifier('Z'))
    )

    # Define Z as wire
    z_wire = vast.Wire('Z')

    # Module items for main module
    items = [z_wire, inst_list, assign_sum]

    # Main module definition
    main_module = vast.ModuleDef("adder_1bit_xmr", None, ports, items)

    # Combine modules using Description
    description = vast.Description([sub_adder, main_module])
    source = vast.Source('adder_1bit_xmr', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)
    with open("adder_1bit_xmr.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 1-bit adder that uses XMR by instantiating a sub-module. Modify the base adder_1bit.py to:

# Create a sub_adder module with ports A, B, CIN, and Z, and logic Z = A ^ B ^ CIN using vast.Assign and nested vast.Xor.
# In the main module:
# Define ports A, B, CIN, and SUM.
# Instantiate sub_adder using vast.Instance with connections .A(A), .B(B), .CIN(CIN), .Z(Z).
# Declare Z as a wire using vast.Wire.
# Assign SUM = Z using vast.Assign.
# Combine modules using vast.Description and vast.Source.
# Name the main module adder_1bit_xmr and write to adder_1bit_xmr.v.
# Align with the test plan’s “module XMR” and “continuous assign” themes.