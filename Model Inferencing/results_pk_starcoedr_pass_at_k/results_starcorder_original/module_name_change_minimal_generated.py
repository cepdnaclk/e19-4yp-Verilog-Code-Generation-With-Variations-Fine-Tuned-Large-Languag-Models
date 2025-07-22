

"""

import argparse
from pyverilog import VerilogParser, VerilogPreproc
import re


class ModuleRenameVisitor(VerilogPreproc):
    """
    Visitor class to find module declarations and rename them.

    Attributes:
        oldname (str): Old name of the module being renamed.
        newname (str): New name for the module.
    """

    def __init__(self, oldname, newname):
        self._oldname = oldname
        self._newname = newname

        # Initialize super class
        VerilogPreproc.__init__(self)

    @property
    def oldname(self):
        return self._oldname

    @property
    def newname(self):
        return self._newname

    def visit_moduledef(self, node):
        """
        Visit a module definition.

        Args:
            node (pyverilog.ast.verilog.ModuleDef): Module definition to be visited.

        Returns:
            pyverilog.ast.verilog.ModuleDef: The modified module definition.
        """

        # Check if the module name matches oldname
        if self._oldname in node.module_name:

            # Replace module name with newname
            node = node.replace(
                module_name=node.module_name.replace(self._oldname,
                                                     self._newname))

            # Update endmodule comments to reference the new name
            for comment in node.comments:

                if 'endmodule' in comment and self._oldname in comment:

                    # Replace old name with new name
                    comment = re.sub(r'\b%s\b' % self._oldname,
                                     self._newname, comment)

                    # Update comment
                    node.comments[comment] = True

        return node


def main():
    """
    Main function for the module rename transformation.

    Returns:
        bool: True if successful; False otherwise.
    """

    parser = argparse.ArgumentParser(description='Rename module names.')
    parser.add_argument('oldname', help='Old name of the module to be renamed')
    parser.add_argument('newname', help='New name for the module')
    args = parser.parse_args()

    # Initialize Verilog parser and preprocessor
    parser = VerilogParser(VerilogPreproc())

    # Parse the input file
    try:
        ast = parser.parse(args.oldname)

        # Create a visitor to find module declarations with old name
        visitor = ModuleRenameVisitor(args.oldname, args.newname)

        # Visit the AST and return modified version of the AST
        newast = visitor.visit(ast)

    except Exception as e:
        print('Error parsing file %s' % args.oldname)
        raise e

    else:

        # Write the modified AST to a file with new name
        try:
            newast.write_to_file(args.newname, overwrite=True)

            return True

        except Exception as e:
            print('Error writing file %s' % args.newname)
            raise e


if __name__ == '__main__':
    main()
