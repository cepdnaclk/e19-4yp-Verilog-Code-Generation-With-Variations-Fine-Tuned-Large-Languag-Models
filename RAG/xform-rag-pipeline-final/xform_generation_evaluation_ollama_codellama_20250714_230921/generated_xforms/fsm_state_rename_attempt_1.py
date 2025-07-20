#!/usr/bin/env python3
"""
Generated Xform: fsm_state_rename
Task: Systematically rename FSM state names throughout a module
Attempt: 1
Generated: 2025-07-15T00:19:14.189163
"""

#!/usr/bin/env python3
        """
        Rename FSM states in a Verilog module.
        """

        from pyverilog import *

        class StateNameVisitor(NodeVisitor):
            """
            AST visitor that identifies state names to rename.
            """

            def __init__(self, from_name, to_name):
                self.from_name = from_name
                self.to_name = to_name
                self.changes_made = []
                self.states_found = False

            def visit(self, node):
                """Visit a node and identify states to rename."""
                if isinstance(node, Node):
                    # Check state declarations
                    if isinstance(node, StateDef):
                        for child in node.children():
                            if hasattr(child, "name") and child.name == self.from_name:
                                self.states_found = True
                                self.changes_made.append(
                                    f"Renamed state '{self.from_name}' to '{self.to_name}'"
                                )

                    # Continue visiting all child nodes
                    for child in node.children():
                        self.visit(child)

        def transform_state_names(input_file, output_file, from_name, to_name):
            """
            Transform state names.

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

                # Check if the state was found
                if not visitor.states_found:
                    print(f"Warning: State '{from_name}' not found")
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Perform the transformations using regex
                modified_content = content

                # 1. Replace state names in state declarations
                pattern = r"\b" + re.escape(from_name) + r"\b"
                replacement = to_name
                modified_content = re.sub(pattern, replacement, modified_content)

                # 2. Replace state names in state assignments
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

        if __name__ == "__main__":
            # Parse command-line arguments
            parser = argparse.ArgumentParser(description="Rename FSM states in a Verilog module.")
            parser.add_argument("input_file", help="Path to input Verilog file")
            parser.add_argument("output_file", help="Path to output Verilog file")
            parser.add_argument("from_name", help="Original state name")
            parser.add_argument("to_name", help="New state name")
            args = parser.parse_args()

            # Perform the transformation
            transform_state_names(args.input_file, args.output_file, args.from_name, args.to_name)