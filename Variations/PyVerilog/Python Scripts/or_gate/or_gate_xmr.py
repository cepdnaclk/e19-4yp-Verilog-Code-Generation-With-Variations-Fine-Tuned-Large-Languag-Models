from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define ports for sub_or module
    a_sub = vast.Ioport(vast.Input('A'))
    b_sub = vast.Ioport(vast.Input('B'))
    z_sub = vast.Ioport(vast.Output('Z'))
    ports_sub = vast.Portlist([a_sub, b_sub, z_sub])

    # Define sub_or module (Z = A | B)
    assign_z = vast.Assign(
        vast.Lvalue(vast.Identifier('Z')),
        vast.Rvalue(vast.Or(vast.Identifier('A'), vast.Identifier('B')))
    )
    items_sub = [assign_z]
    sub_or = vast.ModuleDef("sub_or", None, ports_sub, items_sub)

    # Define ports for main module
    a = vast.Ioport(vast.Input('A'))
    b = vast.Ioport(vast.Input('B'))
    y = vast.Ioport(vast.Output('Y'))
    ports = vast.Portlist([a, b, y])

    # Instantiate sub_or module
    inst = vast.Instance(
        module='sub_or',
        name='inst',
        parameterlist=[],
        portlist=[
            vast.PortArg('A', vast.Identifier('A')),
            vast.PortArg('B', vast.Identifier('B')),
            vast.PortArg('Z', vast.Identifier('Z'))
        ]
    )
    inst_list = vast.InstanceList('sub_or', [], [inst])

    # Define continuous assignment: Y = Z | A
    assign_y = vast.Assign(
        vast.Lvalue(vast.Identifier('Y')),
        vast.Rvalue(vast.Or(vast.Identifier('Z'), vast.Identifier('A')))
    )

    # Define Z as wire
    z_wire = vast.Wire('Z')

    # Module items for main module
    items = [z_wire, inst_list, assign_y]

    # Main module definition
    main_module = vast.ModuleDef("or_gate_xmr", None, ports, items)

    # Combine modules using Description
    description = vast.Description([sub_or, main_module])
    source = vast.Source('or_gate_xmr', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)
    with open("or_gate_xmr.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()


# Prompt:
# Generate a Python script as a variation of or_gate.py using Pyverilog to produce a Verilog module. The original module (or_gate) performs Y = A | B with a continuous assignment. The new script should:

# Define a sub_or module that performs Z = A | B with a continuous assignment, and instantiate it in the main module.
# Use the instantiated module’s output Z in a continuous assignment Y = Z | A using vast.Or to simulate XMR.
# Define both modules in the same script, wrapping them in a vast.Description and vast.Source.
# Use pyverilog.vparser.ast and ASTCodeGenerator for compatibility.
# Save the output to or_gate_xmr.v with main module name or_gate_xmr.
# Ensure the Verilog is syntactically correct and aligns with the test plan’s “module XMR” and “continuous assign” themes.
# Provide the script in an <xaiArtifact> tag with a unique artifact_id and include the expected Verilog output.