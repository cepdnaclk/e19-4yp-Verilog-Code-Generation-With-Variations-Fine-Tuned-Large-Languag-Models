#!/usr/bin/env python3
"""
Generated Xform: signal_rename_basic
Task: Rename any signal throughout a Verilog module
Attempt: 3
Generated: 2025-07-15T00:15:33.460697
"""

#!/usr/bin/env python3
        """
        Transformation to rename a signal in a Verilog module.
        """

        import sys
        import os
        import re
        from pyverilog.vparser.parser import parse
        from pyverilog.vparser.ast import *

        class RenameSignalVisitor(ASTVisitor):
            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.signals_found = False
                self.changes_made = []

            def visit_Signal(self, node):
                if node.name == self.from_name:
                    self.signals_found = True
                    self.changes_made.append(f"Renaming signal '{node.name}' to '{self.to_name}'")
                    node.name = self.to_name
                self.generic_visit(node)

        def transform_rename_signal(input_file, output_file, from_name, to_name):
            try:
                # Read the input file
                with open(input_file, "r") as f:
                    content = f.read()

                # Parse the Verilog file to get the AST
                ast, directives = parse([input_file])

                # Create and apply the visitor to identify signals to rename
                visitor = RenameSignalVisitor(from_name, to_name)
                visitor.visit(ast)

                # Check if the signal was found
                if not visitor.signals_found:
                    print(f"Warning: Signal '{from_name}' not found")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Perform the transformations using regex
                modified_content = content

                # 1. Replace in signal declaration
                signal_pattern = r"(\b" + re.escape(from_name) + r"\b)"
                signal_replacement = to_name
                modified_content = re.sub(signal_pattern, signal_replacement, modified_content)

                # 2. Replace in port list
                port_list_pattern = r"(\b" + re.escape(from_name) + r"\b)(\s*,|\s*\))"
                port_list_replacement = to_name + r"\2"
                modified_content = re.sub(port_list_pattern, port_list_replacement, modified_content)

                # 3. Replace in instance ports
                instance_ports_pattern = r"(\b" + re.escape(from_name) + r"\b)"
                instance_ports_replacement = to_name
                modified_content = re.sub(instance_ports_pattern, instance_ports_replacement, modified_content)

                # Write the output file
                with open(output_file, "w") as f:
                    f.write(modified_content)

                return True
            except Exception as e:
                print(f"Error: {e}")
                return False

        if __name__ == "__main__":
            parser = argparse.ArgumentParser()
            parser.add_argument("input_file", help="Path to input Verilog file")
            parser.add_argument("output_file", help="Path to output Verilog file")
            parser.add_argument("from_name", help="Original signal name")
            parser.add_argument("to_name", help="New signal name")
            args = parser.parse_args()

            if transform_rename_signal(args.input_file, args.output_file, args.from_name, args.to_name):
                print(f"Successfully transformed {args.input_file} to {args.output_file}")
            else:
                print("Error during transformation")