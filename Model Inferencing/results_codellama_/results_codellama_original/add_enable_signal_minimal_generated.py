
```
import pyverilog
import re
from argparse import ArgumentParser
from xform import XForm, XFormError

class AddEnableSignalVisitor(XForm):
    def __init__(self, filename):
        super().__init__(filename)
        self.enable_signal = None

    def visit_module(self, module):
        # Find the counter increment statements
        for stmt in module.statements:
            if isinstance(stmt, pyverilog.vparser.ast.AssignmentStatement):
                lhs = stmt.lhs[0]
                rhs = stmt.rhs[0]
                if isinstance(rhs, pyverilog.vparser.ast.BinaryOperator) and \
                        rhs.operator == "+=" and lhs.name == "counter":
                    self.enable_signal = f"{lhs.name}_en"
                    break

        # Add the enable signal as a new input port
        if self.enable_signal:
            module.inputs.append(pyverilog.vparser.ast.InputDeclaration(self.enable_signal))

        # Wrap counter increments with enable condition
        for stmt in module.statements:
            if isinstance(stmt, pyverilog.vparser.ast.AssignmentStatement):
                lhs = stmt.lhs[0]
                rhs = stmt.rhs[0]
                if isinstance(rhs, pyverilog.vparser.ast.BinaryOperator) and \
                        rhs.operator == "+=" and lhs.name == "counter":
                    stmt.rhs = [pyverilog.vparser.ast.BinaryOperator(self.enable_signal, "&&", rhs)]

        # Preserve existing sensitivity lists and reset logic
        for stmt in module.statements:
            if isinstance(stmt, pyverilog.vparser.ast.AlwaysStatement):
                stmt.sensitivity = [pyverilog.vparser.ast.Identifier(self.enable_signal)] + stmt.sensitivity

        return super().visit_module(module)

def add_enable_signal(filename, enable_signal=None):
    if not filename:
        raise XFormError("No file specified")

    visitor = AddEnableSignalVisitor(filename)
    module = pyverilog.vparser.parse(open(filename).read())
    return visitor.visit_module(module)

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("--file", help="Verilog file to transform")
    parser.add_argument("--enable-signal", help="Enable signal name (default: counter_en)")
    args = parser.parse_args()

    try:
        add_enable_signal(args.file, enable_signal=args.enable_signal)
    except XFormError as e:
        print(f"Error: {e}")
```
This code defines a visitor class `AddEnableSignalVisitor` that inherits from the existing `XForm` class and overrides the `visit_module()` method to perform the transformation. The visitor first finds the counter increment statements using PyVerilog's AST, then adds an enable signal as a new input port and wraps the counter increments with an enable condition using regex. Finally, it preserves existing sensitivity lists and reset logic by adding the enable signal to the sensitivity list of each `Always` statement.

The main transformation function `add_enable_signal()` takes a filename argument and an optional `--enable-signal` argument that specifies the name of the enable signal (default: `counter_en`). It parses the Verilog file using PyVerilog, creates an instance of the visitor class, and applies the visitor to the parsed module.

The code also includes a command-line interface using the `argparse` library that allows users to specify the filename and enable signal name as arguments.