import pyverilog.ast.tools as asttools
import re


class ArrayTransformer(asttools.ASTVisitor):
    def __init__(self, args):
        self.args = args

    def visit_Decl(self, node):
        if isinstance(node.decls[0], asttools.DeclArray):
            # Find fixed array declarations
            decls = [d for d in node.decls if isinstance(d, asttools.DeclArray)]
            for decl in decls:
                # Convert to dynamic array syntax with [] dimensions
                decl.name = decl.name + '[]'
                # Handle multiple dimensions as specified
                dims = re.findall(r'\[(\d+)\]', decl.name)
                if len(dims) > 1:
                    decl.name = decl.name.replace('[' + dims[0] + ']', '[' + ', '.join(dims) + ']')
                else:
                    decl.name = decl.name.replace('[' + dims[0] + ']', '[*]')
                # Preserve base signal type and width
                decl.type = decl.type.replace(decl.name, decl.name + '[]')
            return True

    def visit_Initial(self, node):
        if isinstance(node.continue_stmt, asttools.ContinueStmt) and \
           isinstance(node.continue_stmt.expr, asttools.AssignExpr) and \
           isinstance(node.continue_stmt.expr.lvalue, asttools.DeclArray):
            # Convert fixed array initialization to dynamic array syntax
            decl = node.continue_stmt.expr.lvalue
            decl.name = decl.name + '[]'
            dims = re.findall(r'\[(\d+)\]', decl.name)
            if len(dims) > 1:
                decl.name = decl.name.replace('[' + dims[0] + ']', '[' + ', '.join(dims) + ']')
            else:
                decl.name = decl.name.replace('[' + dims[0] + ']', '[*]')
            # Preserve base signal type and width
            decl.type = decl.type.replace(decl.name, decl.name + '[]')

        return True


def main(args):
    parser = argparse.ArgumentParser()
    parser.add_argument("filename", help="Verilog file to transform")
    args = parser.parse_args()

    with open(args.filename) as f:
        verilog_code = f.read()

    ast = asttools.parse(verilog_code)
    transformer = ArrayTransformer(args)
    result = transformer.visit(ast)

    if not result:
        print("Transformation failed!")
        return

    transformed_verilog_code = str(ast)
    with open(args.filename + ".transformed", "w") as f:
        f.write(transformed_verilog_code)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("filename", help="Verilog file to transform")
    args = parser.parse_args()

    main(args)