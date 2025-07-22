from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports for sub_xor module
    a_sub = vast.Ioport(vast.Input('A'))
    b_sub = vast.Ioport(vast.Input('B'))
    z_sub = vast.Ioport(vast.Output('Z'))
    ports_sub = vast.Portlist([a_sub, b_sub, z_sub])

    # Define sub_xor module (Z = A ^ B)
    assign_z = vast.Assign(
        vast.Lvalue(vast.Identifier('Z')),
        vast.Rvalue(vast.Xor(vast.Identifier('A'), vast.Identifier('B')))
    )
    items_sub = [assign_z]
    sub_xor = vast.ModuleDef("sub_xor", None, ports_sub, items_sub)

    # Define ports for main module
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, y])

    # Instantiate sub_xor module
    inst = vast.Instance(
        module='sub_xor',
        name='inst',
        parameterlist=[],
        portlist=[
            vast.PortArg('A', vast.Identifier('A')),
            vast.PortArg('B', vast.Identifier('B')),
            vast.PortArg('Z', vast.Identifier('Z'))
        ]
    )
    inst_list = vast.InstanceList('sub_xor', [], [inst])

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
    main_module = vast.ModuleDef("xor_gate_xmr", None, ports, items)

    # Combine modules using Description
    description = vast.Description([sub_xor, main_module])
    source = vast.Source('xor_gate_xmr', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)  # Fixed: Changed 'ast' to 'source'
    with open("xor_gate_xmr.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an XOR gate that uses XMR by instantiating a sub-module. Modify the base xor_gate.py to:

# Create a sub_xor module with ports A, B, and Z, and logic Z = A ^ B using vast.Assign and vast.Xor.
# In the main module:
# Define ports A, B, and Y.
# Instantiate sub_xor using vast.Instance with connections .A(A), .B(B), .Z(Z).
# Declare Z as a wire using vast.Wire.
# Assign Y = Z using vast.Assign.
# Combine modules using vast.Description and vast.Source.
# Name the main module xor_gate_xmr and write to xor_gate_xmr.v.
# Align with the test plan’s “module XMR” and “continuous assign” themes.