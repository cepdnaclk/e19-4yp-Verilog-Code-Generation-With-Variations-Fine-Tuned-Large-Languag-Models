#!/usr/bin/env python3
"""
Generated Xform: fsm_state_rename
Task: Systematically rename FSM state names throughout a module
Attempt: 5
Generated: 2025-07-15T00:20:17.793996
"""

#!/usr/bin/env python3
        """
        Transform FSM state names throughout a module.
        """

        import re
        from pyverilog.vparser import parse
        from pyverilog.utils.visitor import Visitor

        class StateNameVisitor(Visitor):
            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.changes_made = []
                self.found_states = False

            def visit(self, node):
                if isinstance(node, Node):
                    # Check FSM states
                    if isinstance(node, FsmState):
                        for child in node.children():
                            if hasattr(child, "name") and child.name == self.from_name:
                                self.found_states = True
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
                visitor.visit(ast)

                # Check if any states were found
                if not visitor.found_states:
                    print(f"Warning: No states with name '{from_name}' found")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Perform the transformations using regex
                modified_content = content

                # 1. Replace state names in FSM declarations
                pattern = r"\b" + re.escape(from_name) + r"\b"
                replacement = to_name
                modified_content = re.sub(pattern, replacement, modified_content)

                # 2. Replace state names in FSM assignments
                pattern = r"\b" + re.escape(from_name) + r"\s*=\s*\b" + re.escape(to_name) + r"\b"
                replacement = from_name + " = " + to_name
                modified_content = re.sub(pattern, replacement, modified_content)

                # Write the modified content to the output file
                with open(output_file, "w") as f:
                    f.write(modified_content)

                print(f"Output written to {output_file}")
                return True

            except Exception as e:
                print(f"Error processing file: {e}")
                import traceback

                traceback.print_exc()
                return False