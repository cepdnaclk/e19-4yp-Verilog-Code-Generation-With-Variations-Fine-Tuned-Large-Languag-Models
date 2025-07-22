
"""

import pyverilog.vparser.ast as ast
from pyverilog import VerilogPreprocessor, VerilogParser
import re


class ArrayVisitor(ast.ASTVisitor):
    """
    Visitor class to find array declarations in the AST

    Attributes:
        array_list (list of tuples): List of arrays found during visitation
            [(array name, array dimensions), ...]

        array_names (set of strings): Set of array names found during visitation
            [array1, array2, ...]
    """

    def __init__(self):
        self.array_list = []
        self.array_names = set()

    @staticmethod
    def get_array(node):
        """
        Get the name and dimensions for an array declaration

        Args:
            node (ast.ArrayDeclaration): Array declaration to extract info from

        Returns:
            tuple of strings: Tuple containing array name, array dimensions
                [array1, [dim1], [dim2], ...]
        """
        array_name = node.name
        array_dims = []
        for dim in node.dimensions:
            array_dims += [dim]
        return (array_name, array_dims)

    def visit_ArrayDeclaration(self, node):
        """
        Visit an ArrayDeclaration

        Args:
            node (ast.ArrayDeclaration): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayVisitor.get_array(node))
        self.array_names.add(node.name)


class ArrayTransformer(ast.ASTTransformer):
    """
    Transformer class to convert array declarations

    Attributes:
        array_list (list of tuples): List of arrays found during visitation
            [(array name, array dimensions), ...]

        array_names (set of strings): Set of array names found during visitation
            [array1, array2, ...]
    """

    def __init__(self):
        self.array_list = []
        self.array_names = set()

    @staticmethod
    def get_array(node):
        """
        Get the name and dimensions for an array declaration

        Args:
            node (ast.ArrayDeclaration): Array declaration to extract info from

        Returns:
            tuple of strings: Tuple containing array name, array dimensions
                [array1, [dim1], [dim2], ...]
        """
        array_name = node.name
        array_dims = []
        for dim in node.dimensions:
            array_dims += [dim]
        return (array_name, array_dims)

    def visit_ArrayDeclaration(self, node):
        """
        Visit an ArrayDeclaration

        Args:
            node (ast.ArrayDeclaration): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayTransformer.get_array(node))
        self.array_names.add(node.name)

    def visit_AssociativeArrayDeclaration(self, node):
        """
        Visit an AssociativeArrayDeclaration

        Args:
            node (ast.AssociativeArrayDeclaration): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayTransformer.get_array(node))
        self.array_names.add(node.name)

    def visit_MultiDimensionalArrayDeclaration(self, node):
        """
        Visit a MultiDimensionalArrayDeclaration

        Args:
            node (ast.MultiDimensionalArrayDeclaration): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayTransformer.get_array(node))
        self.array_names.add(node.name)

    def visit_AssociativeArray(self, node):
        """
        Visit an AssociativeArray

        Args:
            node (ast.AssociativeArray): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayTransformer.get_array(node))
        self.array_names.add(node.name)

    def visit_MultiDimensionalArray(self, node):
        """
        Visit a MultiDimensionalArray

        Args:
            node (ast.MultiDimensionalArray): Array declaration to visit

        Returns:
            None
        """
        self.array_list.append(ArrayTransformer.get_array(node))
        self.array_names.add(node.name)


def array_xform(args):
    """
    Convert array declarations in the Verilog file

    Args:
        args (argparse.Namespace): Namespace containing command-line arguments
            from argparse.ArgumentParser()

    Returns:
        bool: True if successful, False otherwise
    """
    # Get the input and output files
    infilename = args.input_file
    outfilename = args.output_file

    # Open the input file for reading
    try:
        with open(infilename) as fin:
            verilog_code = fin.read()
    except OSError:
        print('Error opening input file')
        return False

    # Preprocess the Verilog code
    preprocessed_code = VerilogPreprocessor().preprocess(verilog_code, infilename)

    # Parse and analyze the Verilog code
    try:
        verilog_ast = VerilogParser(preprocessed_code).parse()
    except Exception as e:
        print('Error parsing input file')
        return False

    # Find array declarations to convert
    array_visitor = ArrayVisitor()
    array_visitor.visit(verilog_ast)

    # Convert the array declarations in the AST
    transformer = ArrayTransformer()
    transformer.visit(verilog_ast)

    # Print the transformed code
    try:
        with open(outfilename, 'w') as fout:
            fout.write(transformer.get_transformed())
    except OSError:
        print('Error opening output file')
        return False

    return True


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('--input-file', type=str, required=True)
    parser.add_argument('--output-file', type=str, required=True)
    args = parser.parse_args()

    array_xform(args)
