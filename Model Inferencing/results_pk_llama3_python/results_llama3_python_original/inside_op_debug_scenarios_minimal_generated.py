import pyverilog.ast.tools as asttools
import re
from argparse import ArgumentParser

class DebugTestCasesXForm(asttools.ASTVisitor):
    def __init__(self, args):
        self.args = args
    
    def visit_module(self, node):
        # Generate value annotation test cases for Verdi debugging
        if self.args.value_annotation:
            print("Generating value annotation test cases...")
            for i in range(len(node.decls)):
                decl = node.decls[i]
                if isinstance(decl, asttools.Decl) and decl.type is not None:
                    type_decl = decl.type
                    if isinstance(type_decl, asttools.TypeDecl):
                        type_decl_list = type_decl.list
                        if len(type_decl_list) > 0:
                            for j in range(len(type_decl_list)):
                                type_decl_item = type_decl_list[j]
                                if isinstance(type_decl_item, asttools.DeclItem):
                                    decl_item_type = type_decl_item.type
                                    if isinstance(decl_item_type, asttools.TypeDecl):
                                        decl_item_type_list = decl_item_type.list
                                        if len(decl_item_type_list) > 0:
                                            for k in range(len(decl_item_type_list)):
                                                decl_item_type_item = decl_item_type_list[k]
                                                if isinstance(decl_item_type_item, asttools.DeclItem):
                                                    print("Value annotation test case for {} {}".format(type_decl.name, decl_item_type_item.name))
        
        # Create trace driver/load functionality tests
        if self.args.trace_driver:
            print("Generating trace driver/load functionality tests...")
            for i in range(len(node.decls)):
                decl = node.decls[i]
                if isinstance(decl, asttools.Decl) and decl.type is not None:
                    type_decl = decl.type
                    if isinstance(type_decl, asttools.TypeDecl):
                        type_decl_list = type_decl.list
                        if len(type_decl_list) > 0:
                            for j in range(len(type_decl_list)):
                                type_decl_item = type_decl_list[j]
                                if isinstance(type_decl_item, asttools.DeclItem):
                                    decl_item_type = type_decl_item.type
                                    if isinstance(decl_item_type, asttools.TypeDecl):
                                        decl_item_type_list = decl_item_type.list
                                        if len(decl_item_type_list) > 0:
                                            for k in range(len(decl_item_type_list)):
                                                decl_item_type_item = decl_item_type_list[k]
                                                if isinstance(decl_item_type_item, asttools.DeclItem):
                                                    print("Trace driver/load functionality test case for {} {}".format(type_decl.name, decl_item_type_item.name))
        
        # Generate scountdriver (signal count driver) scenarios
        if self.args.scountdriver:
            print("Generating scountdriver scenarios...")
            for i in range(len(node.decls)):
                decl = node.decls[i]
                if isinstance(decl, asttools.Decl) and decl.type is not None:
                    type_decl = decl.type
                    if isinstance(type_decl, asttools.TypeDecl):
                        type_decl_list = type_decl.list
                        if len(type_decl_list) > 0:
                            for j in range(len(type_decl_list)):
                                type_decl_item = type_decl_list[j]
                                if isinstance(type_decl_item, asttools.DeclItem):
                                    decl_item_type = type_decl_item.type
                                    if isinstance(decl_item_type, asttools.TypeDecl):
                                        decl_item_type_list = decl_item_type.list
                                        if len(decl_item_type_list) > 0:
                                            for k in range(len(decl_item_type_list)):
                                                decl_item_type_item = decl_item_type_list[k]
                                                if isinstance(decl_item_type_item, asttools.DeclItem):
                                                    print("Scountdriver scenario for {} {}".format(type_decl.name, decl_item_type_item.name))
        
        # Create SHDL XMR force test cases
        if self.args.shdl_xmr_force:
            print("Generating SHDL XMR force test cases...")
            for i in range(len(node.decls)):
                decl = node.decls[i]
                if isinstance(decl, asttools.Decl) and decl.type is not None:
                    type_decl = decl.type
                    if isinstance(type_decl, asttools.TypeDecl):
                        type_decl_list = type_decl.list
                        if len(type_decl_list) > 0:
                            for j in range(len(type_decl_list)):
                                type_decl_item = type_decl_list[j]
                                if isinstance(type_decl_item, asttools.DeclItem):
                                    decl_item_type = type_decl_item.type
                                    if isinstance(decl_item_type, asttools.TypeDecl):
                                        decl_item_type_list = decl_item_type.list
                                        if len(decl_item_type_list) > 0:
                                            for k in range(len(decl_item_type_list)):
                                                decl_item_type_item = decl_item_type_list[k]
                                                if isinstance(decl_item_type_item, asttools.DeclItem):
                                                    print("SHDL XMR force test case for {} {}".format(type_decl.name, decl_item_type_item.name))
        
        # Generate UCLI trace and VPI walker test scenarios
        if self.args.ucli_trace:
            print("Generating UCLI trace and VPI walker test scenarios...")
            for i in range(len(node.decls)):
                decl = node.decls[i]
                if isinstance(decl, asttools.Decl) and decl.type is not None:
                    type_decl = decl.type
                    if isinstance(type_decl, asttools.TypeDecl):
                        type_decl_list = type_decl.list
                        if len(type_decl_list) > 0:
                            for j in range(len(type_decl_list)):
                                type_decl_item = type_decl_list[j]
                                if isinstance(type_decl_item, asttools.DeclItem):
                                    decl_item_type = type_decl_item.type
                                    if isinstance(decl_item_type, asttools.TypeDecl):
                                        decl_item_type_list = decl_item_type.list
                                        if len(decl_item_type_list) > 0:
                                            for k in range(len(decl_item_type_list)):
                                                decl_item_type_item = decl_item_type_list[k]
                                                if isinstance(decl_item_type_item, asttools.DeclItem):
                                                    print("UCLI trace and VPI walker test scenario for {} {}".format(type_decl.name, decl_item_type_item.name))
        
        return super().visit_module(node)

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--value_annotation", action="store_true")
    parser.add_argument("--trace_driver", action="store_true")
    parser.add_argument("--scountdriver", action="store_true")
    parser.add_argument("--shdl_xmr_force", action="store_true")
    parser.add_argument("--ucli_trace", action="store_true")

    args = parser.parse_args()

    xform = DebugTestCasesXForm(args)
    asttools.apply(xform, "test.v")