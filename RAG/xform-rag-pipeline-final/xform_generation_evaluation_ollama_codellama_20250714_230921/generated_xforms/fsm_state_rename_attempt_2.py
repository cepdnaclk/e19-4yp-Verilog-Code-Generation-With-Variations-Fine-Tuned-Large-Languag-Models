#!/usr/bin/env python3
"""
Generated Xform: fsm_state_rename
Task: Systematically rename FSM state names throughout a module
Attempt: 2
Generated: 2025-07-15T00:19:28.507626
"""

#!/usr/bin/env python3
        """
        Transform FSM state names throughout a module.
        """

        import re
        from pyverilog.vparser import parse
        from pyverilog.utils.visitor import NodeVisitor

        class StateNameVisitor(NodeVisitor):
            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.changes_made = []
                self.found_states = False

            def visit(self, node):
                if isinstance(node, Node):
                    # Check for FSM states
                    if isinstance(node, StateDef):
                        self.found_states = True
                        # Replace state name
                        pattern = r"\b" + re.escape(self.from_name) + r"\b"
                        replacement = self.to_name
                        modified_content = re.sub(pattern, replacement, node.content)
                        # Update the AST with the new content
                        node.content = modified_content
                        self.changes_made.append(
                            f"Renamed state '{self.from_name}' to '{self.to_name}'"
                        )

                    # Continue visiting all child nodes
                    for child in node.children():
                        self.visit(child)

        def transform_state_names(input_file, output_file, from_name, to_name):
            """
            Transform FSM state names throughout a module.

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

                # Create and apply the visitor to identify states to rename
                visitor = StateNameVisitor(from_name, to_name)
                visitor.visit(ast)

                # Check if any states were found
                if not visitor.found_states:
                    print(f"Warning: No FSM states found in {input_file}")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Write the modified content to the output file
                with open(output_file, "w") as f:
                    f.write(ast.to_string())

                print(f"Output written to {output_file}")
                return True

            except Exception as e:
                print(f"Error processing file: {e}")
                import traceback

                traceback.print_exc()
                return False

        if __name__ == "__main__":
            input_file = sys.argv[1]
            output_file = sys.argv[2]
            from_name = sys.argv[3]
            to_name = sys.argv[4]
            transform_state_names(input_file, output_file, from_name, to_name)