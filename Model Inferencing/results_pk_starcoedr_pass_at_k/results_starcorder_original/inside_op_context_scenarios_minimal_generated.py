
"""

import argparse
from pyverilog import VerilogModule, VerilogParser
from pyverilog.vparser.ast import AST
from pyverilog.vparser.utils import VParseError


class InsideOperatorVisitor(AST):
    """
    Visitor class to find inside operator usage in different contexts

    Attributes:
        inside_operator (list of tuples): List of tuples containing the line number,
            column number and the text of the inside operator usages found.
    """

    def __init__(self):
        self._inside_operator = []

        super().__init__()

    @property
    def inside_operator(self):
        return self._inside_operator


def inside_operator_xform(ast: VerilogModule, args) -> bool:
    """
    Transformation function to find and replace the inside operator usages.

    Args:
        ast (VerilogModule): AST to be transformed.
        args (argparse.Namespace): Namespace containing command line arguments
            parsed by argparse.

    Returns:
        bool: True if transformation was successful, False otherwise.
    """
    # Create a new visitor class instance and call the visit method on it
    # with the root of the AST as argument.
    inside_operator = InsideOperatorVisitor()
    ast.visit(inside_operator)

    # Iterate through each tuple in the inside operator list to find the
    # line number, column number and text of the inside operator usages found.
    for line_number, col_number, text in inside_operator.inside_operator:
        # Use regex to find the inside operator usages in different contexts.

        # Replace the inside operator usage with the proper syntax.
        # ast.replace_text(line_number, col_number, text)

    return True


def main():
    """
    Main function for the transformation module.

    Raises:
        argparse.ArgumentError: If the input file is not a Verilog file or
            the output file does not have a .v extension.
    """
    parser = argparse.ArgumentParser(description="Inside Operator Transform")
    parser.add_argument("input", help="Input Verilog file.")
    parser.add_argument("-o", "--output", required=True,
                        help="Output Verilog file.")

    args = parser.parse_args()

    # Check if the input file is a Verilog file and that it has a .v extension.
    try:
        ast = VerilogParser(args.input).parse()
    except VParseError as e:
        raise argparse.ArgumentError(
            None, f"Invalid Verilog file {e}") from e

    # Call the transformation function with the parsed AST and command line arguments.
    success = inside_operator_xform(ast, args)

    if not success:
        print("Inside operator transformation failed.")


if __name__ == "__main__":
    main()
