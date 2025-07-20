#!/usr/bin/env python3
"""
Generated Xform: fsm_state_rename
Task: Systematically rename FSM state names throughout a module
Attempt: 4
Generated: 2025-07-15T00:19:59.098576
"""

#!/usr/bin/env python3
        """
        Transform to rename FSM state names throughout a module.
        """

        import re
        from pyverilog.vparser import parse
        from pyverilog.dataflow.visitor import NodeVisitor

        class RenameFSMStatesVisitor(NodeVisitor):
            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.changes_made = []
                self.states_found = False

            def visit(self, node):
                if isinstance(node, Node):
                    # Check for FSM states
                    if isinstance(node, FsmState):
                        self.states_found = True
                        # Replace state name
                        pattern = r"\b" + re.escape(self.from_name) + r"\b"
                        replacement = self.to_name
                        modified_content = re.sub(pattern, replacement, node.name)
                        # Update the AST with the new name
                        node.name = modified_content
                        self.changes_made.append(
                            f"Renamed FSM state '{self.from_name}' to '{self.to_name}'"
                        )

                    # Continue visiting all child nodes
                    for child in node.children():
                        self.visit(child)

        def transform_rename_fsm_states(input_file, output_file, from_name, to_name):
            """
            Transform to rename FSM state names throughout a module.

            Args:
                input_file (str): Path to input Verilog file
                output_file (str): Path to output Verilog file
                from_name (str): Original state name
                to_name (str): New state name

            Returns:
                bool: True if successful, False otherwise
            """
            try:
                # Read the input file
                with open(input_file, "r") as f:
                    content = f.read()

                # Parse the Verilog file to get the AST
                ast, directives = parse([input_file])

                # Create and apply the visitor to identify FSM states to rename
                visitor = RenameFSMStatesVisitor(from_name, to_name)
                visitor.visit(ast)

                # Check if any FSM states were found
                if not visitor.states_found:
                    print(f"Warning: No FSM states found in {input_file}")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Write the modified content to the output file
                with open(output_file, "w") as f:
                    f.write(ast.to_verilog())

                print(f"Output written to {output_file}")
                return True

            except Exception as e:
                print(f"Error processing file: {e}")
                import traceback

                traceback.print_exc()
                return False

        if __name__ == "__main__":
            from argparse import ArgumentParser

            parser = ArgumentParser()
            parser.add_argument("input_file", help="Path to input Verilog file")
            parser.add_argument("output_file", help="Path to output Verilog file")
            parser.add_argument(
                "from_name", help="Original state name to be renamed"
            )
            parser.add_argument(
                "to_name", help="New state name to replace the original name"
            )
            args = parser.parse_args()

            if transform_rename_fsm_states(
                args.input_file, args.output_file, args.from_name, args.to_name
            ):
                print("Transformation successful")
            else:
                print("Error during transformation")