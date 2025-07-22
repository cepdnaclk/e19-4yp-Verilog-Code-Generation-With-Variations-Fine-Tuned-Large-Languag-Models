from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports for sub_inv module
    a_sub = vast.Ioport(vast.Input('A'))
    z_sub = vast.Ioport(vast.Output('Z'))
    ports_sub = vast.Portlist([a_sub, z_sub])

    # Define sub_inv module (Z = ~A)
    assign_z = vast.Assign(
        vast.Lvalue(vast.Identifier('Z')),
        vast.Rvalue(vast.Unot(vast.Identifier('A')))
    )
    items_sub = [assign_z]
    sub_inv = vast.ModuleDef("sub_inv", None, ports_sub, items_sub)

    # Define ports for main module
    a = vast.Ioport(vast.Input('A'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, y])

    # Instantiate sub_inv module
    inst = vast.Instance(
        module='sub_inv',
        name='inst',
        parameterlist=[],
        portlist=[
            vast.PortArg('A', vast.Identifier('A')),
            vast.PortArg('Z', vast.Identifier('Z'))
        ]
    )
    inst_list = vast.InstanceList('sub_inv', [], [inst])

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
    main_module = vast.ModuleDef("inv_gate_xmr", None, ports, items)

    # Combine modules using Description
    description = vast.Description([sub_inv, main_module])
    source = vast.Source('inv_gate_xmr', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)
    with open("inv_gate_xmr.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()

# Prompt:
# Generate a Python script using Pyverilog to create a Verilog module for an inverter gate that uses XMR by instantiating a sub-module. Modify the base inv_gate.py to:

# Create a sub_inv module with ports A and Z, and logic Z = ~A using vast.Assign and vast.Unot.
# In the main module:
# Define ports A and Y.
# Instantiate sub_inv using vast.Instance with connections .A(A), .Z(Z).
# Declare Z as a wire using vast.Wire.
# Assign Y = Z using vast.Assign.
# Combine modules using vast.Description and vast.Source.
# Name the main module inv_gate_xmr and write to inv_gate_xmr.v.
# Align with the test plan’s “module XMR” and “continuous assign” themes.