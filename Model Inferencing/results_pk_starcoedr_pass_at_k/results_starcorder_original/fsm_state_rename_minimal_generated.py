

"""

import pyverilog.vparser.ast as ast
from pyverilog import VerilogPreproc
from pyverilog.vparser.utils import VpiNameKind, VpiObjType
from pyverilog.vparser.visitors import VVisitor
import re


class FSMStateRenamer(VVisitor):
    """
    Visitor class that identifies FSM state enum/parameter declarations and 
    performs the actual text transformations.

    Attributes:
        old_prefix (str): The old prefix to be replaced with new one.
        new_prefix (str): The new prefix to replace old one.
        rename_pattern (str): A regex pattern that matches the old prefix.
    """

    def __init__(self, old_prefix, new_prefix):
        self._old_prefix = old_prefix
        self._new_prefix = new_prefix

        # Regex pattern to match the old prefix in the text.
        self._rename_pattern = re.compile(
            r"(?<=\b)(?P<fsm_state>" + old_prefix + r"\w+)(?=\b)")

    def visit_enum_type(self, enum):

        # If the enum is not a FSM state enum/parameter declaration
        # then return False to stop the search.
        if enum.name != "FSM_STATES":
            return False

        # Iterate through all enum values and rename them.
        for enum_value in enum.enumerators:

            # Get the old prefix from the enum value name.
            old_prefix = self._rename_pattern.search(
                enum_value.name).group("fsm_state")

            if not old_prefix or len(old_prefix) == 0:
                continue

            # Replace the old prefix with new one.
            enum_value.name = re.sub(self._rename_pattern,
                                     self._new_prefix + r"\g<fsm_state>",
                                     enum_value.name)

        return True

    def visit_parameter(self, param):
        """
        Visit a parameter declaration and rename the FSM state enum/parameter 
        declarations in its default value.
        """

        # If the parameter is not a FSM state enum/parameter declaration then
        # return False to stop the search.
        if param.name != "FSM_STATES":
            return False

        # Get the old prefix from the parameter name.
        old_prefix = self._rename_pattern.search(param.value).group("fsm_state")

        if not old_prefix or len(old_prefix) == 0:
            return False

        # Replace the old prefix with new one.
        param.value = re.sub(self._rename_pattern,
                             self._new_prefix + r"\g<fsm_state>",
                             param.value)

        return True


def main():
    """
    Main function that runs the transformation on a Verilog file.

    Args:
        old_prefix (str): The old prefix to be replaced with new one.
        new_prefix (str): The new prefix to replace old one.
    """

    # Parse the command-line arguments.
    parser = argparse.ArgumentParser(description="FSM State Renamer")
    parser.add_argument("old_prefix", help="The old prefix to be replaced.")
    parser.add_argument("new_prefix", help="The new prefix to replace old one.")
    args = parser.parse_args()

    # Get the old and new prefixes from command-line arguments.
    old_prefix, new_prefix = args.old_prefix, args.new_prefix

    # Create a Verilog preprocessor instance with the old prefix.
    vproc = VerilogPreproc(old_prefix)

    # Parse the input file using the preprocessor and get the AST.
    ast = vproc.parse(sys.argv[1])

    # Instantiate FSMStateRenamer visitor class to perform the text 
    # transformations on the AST.
    fsm_state_renamer = FSMStateRenamer(old_prefix, new_prefix)

    # Visit all elements in the AST and rename FSM state enum/parameter names.
    ast.visit(fsm_state_renamer)


if __name__ == "__main__":
    main()
