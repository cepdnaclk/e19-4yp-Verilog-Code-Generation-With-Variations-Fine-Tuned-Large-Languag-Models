
"""

import argparse
from pyverilog import VerilogModule, VerilogParser


class AddEnable(VerilogModule):
    """Add an enable signal to control a counter."""

    def __init__(self):
        super().__init__()

        self._counter = None
        self._enable_signal = None

    @property
    def counter(self) -> str:
        return self._counter

    @counter.setter
    def counter(self, value: str):
        self._counter = value

    @property
    def enable_signal(self) -> str:
        return self._enable_signal

    @enable_signal.setter
    def enable_signal(self, value: str):
        self._enable_signal = value


class AddEnableVisitor(VerilogModule):
    """Add an enable signal to control a counter."""

    def __init__(self):
        super().__init__()

        self._counter = None
        self._enable_signal = None

    @property
    def counter(self) -> str:
        return self._counter

    @counter.setter
    def counter(self, value: str):
        self._counter = value

    @property
    def enable_signal(self) -> str:
        return self._enable_signal

    @enable_signal.setter
    def enable_signal(self, value: str):
        self._enable_signal = value


class AddEnableTransformer(VerilogModule):
    """Add an enable signal to control a counter."""

    def __init__(self):
        super().__init__()

        self._counter = None
        self._enable_signal = None

    @property
    def counter(self) -> str:
        return self._counter

    @counter.setter
    def counter(self, value: str):
        self._counter = value

    @property
    def enable_signal(self) -> str:
        return self._enable_signal

    @enable_signal.setter
    def enable_signal(self, value: str):
        self._enable_signal = value


def main():
    """Main function."""
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Input Verilog file")
    args = parser.parse_args()

    # Parse the input file and extract the target elements
    with open(args.input, "r") as f:
        ast = VerilogParser().parse(f)

        # Find counter increment statements (counter <= counter + 1)
        for node in ast.walk():
            if isinstance(node, ast.Assign):
                lhs_node = node[0]

                if isinstance(lhs_node, ast.Identifier):
                    lhs_name = lhs_node.name

                    if lhs_name == "counter":
                        rhs_node = node[-1]

                        if isinstance(rhs_node, ast.BinaryOp) and \
                                rhs_node.op == "+":
                            # Add enable signal as new input port
                            add_enable_visitor = AddEnableVisitor()

                            add_enable_visitor.counter = lhs_name
                            add_enable_visitor.enable_signal = "enable"

                            # Wrap counter increments with enable condition
                            add_enable_transformer = AddEnableTransformer(
                                add_enable_visitor)

                            add_enable_transformer.counter = lhs_name
                            add_enable_transformer.enable_signal = \
                                add_enable_visitor.enable_signal

                            print(add_enable_transformer.transform())


if __name__ == "__main__":
    main()
