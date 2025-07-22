
"""

import pyverilog.vparser.ast as ast
from pyverilog import VerilogPreproc
from pyverilog.vparser.utils import VpiArrayVar
from pyverilog.vparser.utils import VpiVarType, VpiVarWidth
from pyverilog.vparser.utils import VpiVarValue
import re


class ArrayVisitor(ast.ASTVisitor):
    """
    Visitor class to find fixed array declarations in the AST

    Attributes:
        array_list (list of tuples): List of fixed arrays found during visitation
            [(array name, array size), ...]

        array_dict (dict): Dictionary of fixed arrays found during visitation
            {array name : array size}

        array_pattern (str): Regex pattern to match fixed array declarations
    """

    def __init__(self):
        self.array_list = []  # List of fixed arrays found in the AST
        self.array_dict = {}  # Dictionary of fixed arrays found in the AST
        self.array_pattern = r"^\s*(\w+)\s*\((\d+)(?:\[(.*)\])?\)"

    def visit_Fixed(self, node):
        """
        Visit Fixed array declarations

        Args:
            node (ast.Fixed): Fixed array declaration to be visited

        Returns:
            None
        """
        match = re.match(self.array_pattern, str(node))
        if not match is None and len(match.groups()) == 3:
            self.array_list.append((match[1], int(match[2])))
            self.array_dict[match[1]] = int(match[2])


class ArrayTransformer(ast.ASTVisitor):
    """
    Visitor class to convert fixed array declarations in the AST

    Attributes:
        array_pattern (str): Regex pattern to match fixed array declarations

        array_pattern_replace (str): Regex pattern for replacements of fixed
            arrays with dynamic arrays
    """

    def __init__(self, array_pattern=r"^\s*(\w+)\s*\((\d+)(?:\[(.*)\])?\)",
                 array_pattern_replace=r"\1[\2][\3]"):
        self.array_list = []  # List of fixed arrays found in the AST
        self.array_dict = {}  # Dictionary of fixed arrays found in the AST

        self.array_pattern = re.compile(array_pattern)
        self.array_pattern_replace = array_pattern_replace

    def visit_Fixed(self, node):
        """
        Visit Fixed array declarations and convert them to dynamic arrays

        Args:
            node (ast.Fixed): Fixed array declaration to be visited

        Returns:
            None
        """
        match = re.match(self.array_pattern, str(node))
        if not match is None and len(match.groups()) == 3:

            # Convert fixed array to dynamic array syntax
            new_node = ast.Array(
                name=ast.Identifier(match[1]),
                size=VpiVarValue(int(match[2])),
                dim=ast.DimensionList([
                    VpiArrayVar(
                        name=ast.Identifier(match[3].split(',')[0]),
                        width=VpiVarWidth(
                            int(match[3].split(',')[1]))
                    ) if len(match) == 4 else None])
            )

            # Replace the fixed array declaration with dynamic array syntax
            self._replace_node(new_node, node)


def main():
    """
    Main function to run the transformation

    Returns:
        None
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input Verilog file")
    parser.add_argument("-o", "--output",
                        help="Output Verilog file (default: stdout)")
    args = parser.parse_args()

    # Parse the input Verilog file and find fixed array declarations in it
    preproc = VerilogPreproc(args.input)
    preproc.preprocess()
    ast_tree = preproc.get_ast()
    array_visitor = ArrayVisitor()
    array_visitor.visit(ast_tree)

    # Convert the fixed arrays to dynamic arrays
    transformer = ArrayTransformer()
    transformer.visit(ast_tree)


if __name__ == "__main__":
    main()
