from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports for sub_mux module
    a_sub = vast.Ioport(vast.Input('A'))
    b_sub = vast.Ioport(vast.Input('B'))
    sel_sub = vast.Ioport(vast.Input('SEL'))
    z_sub = vast.Ioport(vast.Output('Z'))
    ports_sub = vast.Portlist([a_sub, b_sub, sel_sub, z_sub])

    # Define sub_mux module (Z = SEL ? A : B)
    assign_z = vast.Assign(
        vast.Lvalue(vast.Identifier('Z')),
        vast.Rvalue(vast.Cond(vast.Identifier('SEL'), vast.Identifier('A'), vast.Identifier('B')))
    )
    items_sub = [assign_z]
    sub_mux = vast.ModuleDef("sub_mux", None, ports_sub, items_sub)

    # Define ports for main module
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    sel = vast.Ioport(vast.Input('SEL'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, sel, y])

    # Instantiate sub_mux module
    inst = vast.Instance(
        module='sub_mux',
        name='inst',
        parameterlist=[],
        portlist=[
            vast.PortArg('A', vast.Identifier('A')),
            vast.PortArg('B', vast.Identifier('B')),
            vast.PortArg('SEL', vast.Identifier('SEL')),
            vast.PortArg('Z', vast.Identifier('Z'))
        ]
    )
    inst_list = vast.InstanceList('sub_mux', [], [inst])

    # Define continuous assignment: Y = Z
    assign_y = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Identifier('Z'))
    )

    # Define Z as wire
    z_wire = vast.Wire('Z')

    # Module items for main module
    items = [z_wire, inst_list, assign_y]

    # Main module definition
    main_module = vast.ModuleDef("mux_2to1_xmr", None, ports, items)

    # Combine modules using Description
    description = vast.Description([sub_mux, main_module])
    source = vast.Source('mux_2to1_xmr', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)
    with open("mux_2to1_xmr.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for a 2:1 multiplexer that uses XMR by instantiating a sub-module. Modify the base mux_2to1.py to:

# Create a sub_mux module with ports A, B, SEL, and Z, and logic Z = SEL ? A : B using vast.Assign and vast.Cond.
# In the main module:
# Define ports A, B, SEL, and Y.
# Instantiate sub_mux using vast.Instance with connections .A(A), .B(B), .SEL(SEL), .Z(Z).
# Declare Z as a wire using vast.Wire.
# Assign Y = Z using vast.Assign.
# Combine modules using vast.Description and vast.Source.
# Name the main module mux_2to1_xmr and write to mux_2to1_xmr.v.
# Align with the test plan’s “module XMR” and “continuous assign” themes.