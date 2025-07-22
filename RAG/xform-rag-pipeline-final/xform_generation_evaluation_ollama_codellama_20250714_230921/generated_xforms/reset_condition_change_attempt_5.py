#!/usr/bin/env python3
"""
Generated Xform: reset_condition_change
Task: Change reset condition from active-high to active-low or vice versa
Attempt: 5
Generated: 2025-07-15T00:18:56.514108
"""

#!/usr/bin/env python3
        """
        Transformation to change reset condition from active-high to active-low or vice versa.
        """

        import sys
        import os
        import re
        import argparse
        from pyverilog.vparser.parser import parse
        from pyverilog.vparser.ast import *

        def transform_reset_condition(
            input_file, output_file, reset_signal, active_high_to_low=True
        ):
            """
            Transform reset condition from active-high to active-low or vice versa.

            Args:
                input_file (str): Path to input Verilog file
                output_file (str): Path to output Verilog file
                reset_signal (str): Name of the reset signal
                active_high_to_low (bool): True to change from active-high to active-low,
                                          False to change from active-low to active-high

            Returns:
                bool: True if successful, False otherwise
            """
            try:
                # Read the input file
                with open(input_file, "r") as f:
                    content = f.read()

                # Parse the Verilog file to get the AST
                ast, directives = parse([input_file])

                # Create and apply the visitor to identify reset conditions
                visitor = ResetConditionVisitor(reset_signal, active_high_to_low)
                visitor.visit(ast)

                # Check if reset conditions were found
                if not visitor.reset_conditions_found and not visitor.reset_edges_found:
                    high_low_str = "high" if active_high_to_low else "low"
                    print(
                        f"Warning: No active-{high_low_str} reset conditions found for '{reset_signal}'"
                    )
                    return False

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Perform the transformations using regex
                modified_content = content

                class ResetConditionVisitor:
                    """
                    AST visitor that identifies reset conditions.
                    """

                    def __init__(self, reset_signal, active_high_to_low=True):
                        self.reset_signal = reset_signal
                        self.active_high_to_low = active_high_to_low
                        self.changes_made = []
                        self.reset_conditions_found = []
                        self.reset_edges_found = []

                    def visit(self, node):
                        """Visit a node and identify reset conditions."""
                        if isinstance(node, Node):
                            # Check for if statements with reset conditions
                            if isinstance(node, IfStatement):
                                cond = node.cond

                                # Check for active-high reset: if(RST)
                                if (
                                    self.active_high_to_low
                                    and isinstance(cond, Identifier)
                                    and cond.name == self.reset_signal
                                ):
                                    self.reset_conditions_found.append(
                                        {
                                            "type": "active_high",
                                            "line": cond.lineno if hasattr(cond, "lineno") else None,
                                        }
                                    )

                                # Check for active-low reset: if(!RST)
                                elif (
                                    not self.active_high_to_low
                                    and isinstance(cond, Unot)
                                    and isinstance(cond.right, Identifier)
                                    and cond.right.name == self.reset_signal
                                ):
                                    self.reset_conditions_found.append(
                                        {
                                            "type": "active_low",
                                            "line": cond.lineno if hasattr(cond, "lineno") else None,
                                        }
                                    )

                # Print summary of changes
                for change in visitor.changes_made:
                    print(change)

                # Perform the transformations using regex
                modified_content = content

                # 1. Transform reset conditions in if statements
                if active_high_to_low:
                    # Change from if(RST) to if(!RST)
                    pattern = r"if\s*\(\s*" + re.escape(reset_signal) + r"\s*\)"
                    replacement = f"if(!{reset_signal})"
                    modified_content = re.sub(pattern, replacement, modified_content)
                else:
                    # Change from if(!RST) to if(RST)
                    pattern = r"if\s*\(\s*!\s*" + re.escape(reset_signal) + r"\s*\)"
                    replacement = f"if({reset_signal})"
                    modified_content = re.sub(pattern, replacement, modified_content)

                # 2. Transform reset edges in sensitivity lists
                if active_high_to_low:
                    # Change from posedge RST to negedge RST
                    pattern = r"posedge\s+" + re.escape(reset_signal)
                    replacement = f"negedge {reset_signal}"
                    modified_content = re.sub(pattern, replacement, modified_content)
                else:
                    # Change from negedge RST to posedge RST
                    pattern = r"negedge\s+" + re.escape(reset_signal)
                    replacement = f"posedge {reset_signal}"
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
            parser = argparse.ArgumentParser(description="Change reset condition")
            parser.add_argument("input_file", help="Path to input Verilog file")
            parser.add_argument("output_file", help="Path to output Verilog file")
            parser.add_argument("reset_signal", help="Name of the reset signal")
            parser.add_argument(
                "--active-high-to-low",
                action="store_true",
                help="Change from active-high to active-low",
            )
            parser.add_argument(
                "--active-low-to-high",
                action="store_true",
                help="Change from active-low to active-high",
            )
            args = parser.parse_args()

            if (
                not args.active_high_to_low
                and not args.active_low_to_high
            ):
                print("Error: Must specify either --active-high-to-low or --active-low-to-high")
                sys.exit(1)

            if (
                args.active_high_to_low
                and args.active_low_to_high
            ):
                print("Error: Cannot specify both --active-high-to-low and --active-low-to-high")
                sys.exit(1)

            if not os.path.exists(args.input_file):
                print(f"Error: Input file '{args.input_file}' does not exist")
                sys.exit(1)

            if args.output_file == args.input_file:
                print("Error: Output file cannot be the same as input file")
                sys.exit(1)

            transform_reset_condition(
                args.input_file,
                args.output_file,
                args.reset_signal,
                active_high_to_low=args.active_high_to_low,
            )