from __future__ import absolute_import
from __future__ import print_function
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

def main():
    # Define sub_module with array
    values_sub = vast.Reg('values', width=vast.Width(vast.IntConst('7'), vast.IntConst('0')), 
                          dimensions=vast.Dimensions([vast.Length(vast.IntConst('3'), vast.IntConst('0'))]))
    init_values = [
        vast.BlockingSubstitution(
            vast.Lvalue(vast.Pointer(vast.Identifier('values'), vast.IntConst(str(i)))),
            vast.Rvalue(vast.IntConst(str(100 + i * 10)))
        ) for i in range(4)
    ]
    initial_sub = vast.Initial(vast.Block(init_values))
    sub_module = vast.ModuleDef("sub_module", None, vast.Portlist([]), [values_sub, initial_sub])

    # Define main module ports
    a = vast.Ioport(vast.Input('A', width=vast.Width(vast.IntConst('7'), vast.IntConst('0'))))
    x = vast.Ioport(vast.Output('X'))
    ports = vast.Portlist([a, x])

    # Define X as reg
    x_reg = vast.Reg('X')

    # Instantiate sub_module
    inst = vast.Instance(module='sub_module', name='inst', parameterlist=[], portlist=[])
    inst_list = vast.InstanceList('sub_module', [], [inst])

    # Continuous assignment with XMR
    compare = vast.Eq(vast.Identifier('A'), vast.Identifier('inst.values[0]'))
    for i in range(1, 4):
        compare = vast.Lor(compare, vast.Eq(vast.Identifier('A'), vast.Identifier(f'inst.values[{i}]')))
    assign = vast.Assign(vast.Lvalue(vast.Identifier('X')), vast.Rvalue(compare))

    # Module items
    items = [x_reg, inst_list, assign]

    # Main module definition
    main_module = vast.ModuleDef("inside_var5", None, ports, items)

    # Combine modules
    description = vast.Description([sub_module, main_module])
    source = vast.Source('inside_var5', description)

    # Generate Verilog code
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(source)
    with open("inside_var5.v", "w") as f:
        f.write(rslt)

if __name__ == '__main__':
    main()
