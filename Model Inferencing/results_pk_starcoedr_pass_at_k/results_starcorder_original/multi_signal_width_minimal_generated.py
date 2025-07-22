
"""

import argparse
from pyverilog import VerilogModule, VerilogParser
import re


class BitWidthChangeVisitor(VerilogModule):
    """
    Visitor class to find signals and their bit widths in a Verilog module

    Attributes:
        signal_names (list of str) : List of signal names to change width for.
        new_width (int) : New bit width specification.
        old_width (int) : Old bit width specification.
        signal_declarations (list of str): List of signal declarations in the module.
        signals_to_change (list of str): List of signals that need to be changed.
    """

    def __init__(self, signal_names: list, new_width: int = None) -> None:

        self._signal_names = signal_names
        self._new_width = new_width
        self._old_width = 0
        self._signal_declarations = []
        self.signals_to_change = []

    def visit(self):
        """
        Visit the module and find all signals that need to be changed

        Returns:
            True if successful, False otherwise.
        """

        try:

            # Find all signal declarations in the module
            self._signal_declarations = [
                declaration for declaration in self.get_all_signals()
                if re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                    re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

            # Find all signals that need to be changed
            self._signals_to_change = [
                signal for signal in self._signal_declarations if
                signal.split()[1] == self._new_width and signal not in self._signal_names]

        except Exception as e:
            print(e)
            return False
        else:
            return True

    def get_all_signals(self):
        """
        Get all signal declarations from the module

        Returns:
            List of signal declarations.
        """

        return [declaration for declaration in self.get_all_declarations() if
                re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                    re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

    def get_all_declarations(self):
        """
        Get all declarations from the module

        Returns:
            List of declarations.
        """

        return self._module.get_all_declarations()


class BitWidthChangeTransform():
    """
    Transformation class to change bit width of signals in a Verilog module

    Attributes:
        signal_names (list of str) : List of signal names to change width for.
        new_width (int) : New bit width specification.
        old_width (int) : Old bit width specification.
        signal_declarations (list of str): List of signal declarations in the module.
    """

    def __init__(self, signal_names: list, new_width: int = None) -> None:

        self._signal_names = signal_names
        self._new_width = new_width
        self._old_width = 0
        self._signal_declarations = []

    @staticmethod
    def _get_all_signals(module):
        """
        Get all signal declarations from the module.

        Args:
            module (VerilogModule) : Module to get signals for.

        Returns:
            List of signal declarations.
        """

        return [declaration for declaration in module.get_all_declarations() if
                re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                    re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

    @staticmethod
    def _get_all_declarations(module):
        """
        Get all declarations from the module

        Args:
            module (VerilogModule) : Module to get declarations for.

        Returns:
            List of declarations.
        """

        return module.get_all_declarations()

    def visit(self, module):
        """
        Visit a module and find signals that need to be changed.

        Args:
            module (VerilogModule) : Module to visit.

        Returns:
            True if successful, False otherwise.
        """

        try:

            # Find all signal declarations in the module
            self._signal_declarations = [
                declaration for declaration in BitWidthChangeTransform._get_all_signals(module)
                if re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                    re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

            # Find all signals that need to be changed
            self._signals_to_change = [
                signal for signal in self._signal_declarations if
                signal.split()[1] == self._new_width and signal not in self._signal_names]

        except Exception as e:
            print(e)
            return False
        else:
            return True

    def transform(self, module):
        """
        Transform a module to change bit width of signals that need it.

        Args:
            module (VerilogModule) : Module to visit and transform.

        Returns:
            True if successful, False otherwise.
        """

        try:

            # Find all signal declarations in the module
            self._signal_declarations = [
                declaration for declaration in BitWidthChangeTransform._get_all_signals(module)
                if re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                    re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

            # Find all signals that need to be changed
            self._signals_to_change = [
                signal for signal in self._signal_declarations if
                signal.split()[1] == self._new_width and signal not in self._signal_names]

        except Exception as e:
            print(e)
            return False
        else:

            # Change the bit width of each signal that needs it
            for signal in self._signals_to_change:

                # Find the index of the signal declaration
                signal_index = [i for i, s in enumerate(self._signal_declarations)
                                if s == signal][0]

                # Get the old bit width specification
                old_width = int(
                    re.search(r"\[(\d+)\]", self._signal_declarations[signal_index]).group(1))

                # Update the bit width of the signal declaration
                self._signal_declarations[signal_index] = \
                    self._signal_declarations[signal_index].replace(
                        f"[{old_width}]", f"[{self._new_width}]")

            return True


def main():
    """
    Main function for the transformation module.

    Returns:
        True if successful, False otherwise.
    """

    # Parse arguments from command line
    parser = argparse.ArgumentParser()
    parser.add_argument("module", help="Verilog module to transform.")
    parser.add_argument("-s", "--signal-names", nargs='+',
                        help="List of signal names to change width for.", required=True)
    parser.add_argument("--new-width", type=int, default=None,
                        help="New bit width specification")

    args = parser.parse_args()

    # Parse the module and find all signals that need changing
    try:

        # Get the module
        module = VerilogParser(args.module).get_top_module()

        # Find all signal declarations in the module
        signal_declarations = [
            declaration for declaration in BitWidthChangeTransform._get_all_signals(module)
            if re.search(r"^\s*reg\s+(\w+)\s*\[", declaration) or
                re.search(r"^\s*wire\s+(\w+)\s*\[", declaration)]

        # Find all signals that need to be changed
        signals_to_change = [
            signal for signal in signal_declarations if
            int(signal.split()[1]) == args.new_width and signal not in args.signal_names]

    except Exception as e:
        print(e)
        return False
    else:

        # Change the bit width of each signal that needs it
        for signal in signals_to_change:

            # Find the index of the signal declaration
            signal_index = [i for i, s in enumerate(signal_declarations)
                            if s == signal][0]

            # Get the old bit width specification
            old_width = int(
                re.search(r"\[(\d+)\]", signal_declarations[signal_index]).group(1))

            # Update the bit width of the signal declaration
            signal_declarations[signal_index] = \
                signal_declarations[signal_index].replace(
                    f"[{old_width}]", f"[{args.new_width}]")

        print(f"Successfully changed bit widths for signals {args.signal_names}")
        return True


if __name__ == "__main__":
    main()
