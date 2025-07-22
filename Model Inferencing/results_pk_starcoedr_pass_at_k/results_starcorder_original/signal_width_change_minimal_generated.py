

"""

import argparse
from pyverilog import VerilogParser, VerilogDataflowGraph
from pyverilog.vparser.ast import *


class ChangeSignalWidth(VerilogDataflowGraph):
    """
    This class is a pattern that will be used to find and modify signal declarations in a Verilog file.
    It inherits from the VerilogDataflowGraph class which provides a dataflow graph representation of the AST.
    """

    def __init__(self, args=None):
        super().__init__()

        self._args = args or argparse.ArgumentParser()
        self._args.add_argument(
            "-i", "--input-file", help="Input Verilog file to be transformed.", required=True)
        self._args.add_argument("-o", "--output-file",
                                help="Output Verilog file with modified signal declarations.")

        self._args = self._args.parse_args()

    def visit_SignalDeclaration(self, node):
        """
        This method is a pattern that will be used to find and modify signal declarations in a Verilog file.
        It inherits from the VerilogDataflowGraph class which provides a dataflow graph representation of the AST.

        Parameters:
            node (SignalDeclaration): The SignalDeclaration node to be visited.

        Returns:
            bool: True if the node was modified, False otherwise.
        """

        # If the node is not a signal declaration or it does not have a width specification, return early.
        if not isinstance(node, SignalDeclaration) or not node.width_spec:
            return False

        # Get the current bit width of the signal.
        current_width = int(node.width_spec[0].value)

        # If the current bit width is less than 16 bits, return early since we cannot change it to a larger value.
        if current_width < 16:
            return False

        # Get the new bit width that will be used for the signal declaration.
        new_width = self._args.new_width or int(current_width / 2)

        # If the new bit width is less than 8 bits, return early since we cannot change it to a smaller value.
        if new_width < 8:
            return False

        # Create a new width specification for the signal declaration using the new bit width.
        new_width = BitWidth(BitSize(new_width))

        # Replace the existing width specification with the new one in the node's dataflow graph.
        self._replace_width_spec(node, new_width)

        return True

    def _replace_width_spec(self, node, new_width):
        """
        This method is a helper function that replaces an existing width specification of a signal declaration with a new one.

        Parameters:
            node (SignalDeclaration): The SignalDeclaration node whose width specification will be replaced.
            new_width (BitWidth): The new BitWidth object to replace the old one in the dataflow graph.
        """

        # Find the index of the existing width specification in the node's dataflow graph.
        spec_index = self._get_width_spec_index(node)

        # Replace the existing width specification with the new one at that index.
        self._replace_dataflow_graph_node(
            node, spec_index, new_width)

    def _get_width_spec_index(self, node):
        """
        This method is a helper function that finds the index of an existing width specification in a SignalDeclaration node's dataflow graph.

        Parameters:
            node (SignalDeclaration): The SignalDeclaration node whose width specification will be replaced.

        Returns:
            int: The index of the existing width specification in the dataflow graph, or -1 if not found.
        """

        # Find the index of the existing width specification in the node's dataflow graph.
        for i, child_node in enumerate(self._dataflow_graph):

            # If this is a signal declaration and it has an existing width specification, return its index.
            if isinstance(child_node, SignalDeclaration) \
                    and len(child_node.width_spec) > 0:
                return i

        # Return -1 if no matching node was found in the dataflow graph.
        return -1


def main():
    """
    This function is a main entry point for the transformation module that changes signal declarations' bit widths.

    Returns:
        int: The exit code of the program, 0 on success and non-zero otherwise.
    """

    # Create an instance of the ChangeSignalWidth class with command line arguments.
    change_signal_width = ChangeSignalWidth()

    # Parse and analyze the input Verilog file using PyVerilog's VerilogParser.
    parser = VerilogParser(change_signal_width._args.input_file)
    parser.parse()

    # Print out the modified Verilog code to stdout if an output file was not specified.
    if change_signal_width._args.output_file is None:
        print(parser.code())

        return 0

    # Write the modified Verilog code to a new file using PyVerilog's VerilogDataflowGraph.
    parser = VerilogParser()
    parser.parse(change_signal_width._args.input_file)
    parser.write(change_signal_width._args.output_file,
                 change_signal_width._args.input_file)

    return 0


if __name__ == "__main__":
    exit(main())
