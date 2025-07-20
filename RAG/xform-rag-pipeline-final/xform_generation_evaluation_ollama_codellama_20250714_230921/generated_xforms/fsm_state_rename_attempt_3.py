#!/usr/bin/env python3
"""
Generated Xform: fsm_state_rename
Task: Systematically rename FSM state names throughout a module
Attempt: 3
Generated: 2025-07-15T00:19:42.376931
"""

#!/usr/bin/env python3
        """
        Transform FSM state names throughout a module.
        """

        import re
        from pyverilog.vparser import parse
        from pyverilog.utils.utility import traverse_ast

        class StateNameVisitor:
            """
            AST visitor that identifies FSM states to rename.
            """

            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.changes_made = []
                self.states_found = False

            def visit(self, node):
                """Visit a node and identify FSM states to rename."""
                if isinstance(node, Node):
                    # Check FSM state declarations
                    if isinstance(node, FsmState):
                        for child in node.children():
                            if hasattr(child, "name") and child.name == self.from_name:
                                self.states_found = True
                                # Replace state name with new value
                                pattern = r"\b" + re.escape(self.from_name) + r"\b"
                                replacement = f"{self.to_name}"
                                child.name = re.sub(pattern, replacement, child.name)

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

                # Create and apply the visitor to identify FSM states to rename
                visitor = StateNameVisitor(from_name, to_name)
                traverse_ast(ast, visitor)

                # Check if any states were found
                if not visitor.states_found:
                    print(f"Warning: No FSM states with name '{from_name}' found")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Write the modified content to the output file
                with open(output_file, "w") as f:
                    f.write(str(ast))

                print(f"Output written to {output_file}")
                return True

            except Exception as e:
                print(f"Error processing file: {e}")
                import traceback

                traceback.print_exc()
                return False