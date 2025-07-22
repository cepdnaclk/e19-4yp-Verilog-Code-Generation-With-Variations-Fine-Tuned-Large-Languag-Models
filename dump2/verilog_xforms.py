#!/usr/bin/env python3
"""
PyVerilog Xform Transformations

This module implements various transformations (xforms) for Verilog code
using the PyVerilog AST. These transformations can generate variations
of Verilog code for testing, verification, or other purposes.
"""

from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import copy
import random
import argparse

# Print Python version and system info for debugging
print(f"Python version: {sys.version}")
print(f"Running script: {__file__}")
print(f"Arguments: {sys.argv}")

# Try to import PyVerilog components
try:
    import pyverilog
    import pyverilog.vparser.ast as vast
    from pyverilog.vparser.parser import VerilogCodeParser
    from pyverilog.ast_code_generator.codegen import ASTCodeGenerator

    print(
        f"PyVerilog version: {pyverilog.__version__ if hasattr(pyverilog, '__version__') else 'unknown'}"
    )
except ImportError as e:
    print(f"Error importing PyVerilog: {e}")
    print("Please make sure PyVerilog is installed:")
    print("  pip install pyverilog")
    sys.exit(1)

print("-" * 50)


class XformVisitor:
    """Base visitor class for implementing transformations on the AST."""

    def __init__(self):
        self.modified = False

    def visit(self, node):
        """Visit a node and dispatch to the appropriate method."""
        method = "visit_" + node.__class__.__name__
        visitor = getattr(self, method, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        """Visit all children of a node."""
        for attr_name, attr_value in node.__dict__.items():
            if isinstance(attr_value, vast.Node):
                setattr(node, attr_name, self.visit(attr_value))
            elif isinstance(attr_value, list):
                new_values = []
                for i, child in enumerate(attr_value):
                    if isinstance(child, vast.Node):
                        new_child = self.visit(child)
                        new_values.append(new_child)
                    else:
                        new_values.append(child)
                setattr(node, attr_name, new_values)
        return node


class ParameterScalingXform(XformVisitor):
    """
    Transform parameter values by scaling them.

    This transformation tests how designs handle different scaling factors
    for parameter values.
    """

    def __init__(self, xform_to_all=False, random_seed=None):
        super().__init__()
        self.xform_to_all = xform_to_all
        self.first_transform = False
        if random_seed is not None:
            random.seed(random_seed)

    def visit_Parameter(self, node):
        """Visit parameter declarations."""
        # Skip parameters that don't have a value
        if not hasattr(node, "value") or not isinstance(node.value, vast.Rvalue):
            return node

        # Check if parameter value is an integer constant
        value = node.value.var
        if isinstance(value, vast.IntConst):
            # Apply transformation based on configured behavior
            if not self.first_transform:
                self.first_transform = True
                # Scale the parameter value (multiply by 2)
                new_value = int(value.value) * 2
                node.value.var = vast.IntConst(str(new_value))
                self.modified = True
            elif (
                self.xform_to_all or random.random() < 0.5
            ):  # 50% chance if not xform_to_all
                # Scale the parameter value (multiply by 2)
                new_value = int(value.value) * 2
                node.value.var = vast.IntConst(str(new_value))
                self.modified = True

        return node


class RandomlyMovePortsToInterfaceXform(XformVisitor):
    """
    Transforms port declarations to be part of an interface.

    This transformation helps test how designs handle interface-based
    connectivity and port organization.
    """

    def __init__(self, xform_to_all=False, random_seed=None):
        super().__init__()
        self.xform_to_all = xform_to_all
        self.first_transform = False
        self.ports_to_move = []
        self.interface_name = "TestInterface"
        if random_seed is not None:
            random.seed(random_seed)

    def visit_ModuleDef(self, node):
        """Visit module definition to identify ports to move to interface."""
        portlist = node.portlist
        if not portlist or not portlist.ports:
            return node

        # Select ports to move to interface
        candidates = []
        for port in portlist.ports:
            if isinstance(port, vast.Ioport) and not self._is_top_port(port):
                candidates.append(port)

        if not candidates:
            return node

        # Decide which ports to move
        if self.xform_to_all:
            self.ports_to_move = candidates
        else:
            # Move a random subset (at least one if there are candidates)
            num_to_move = max(1, random.randint(1, len(candidates) // 2))
            self.ports_to_move = random.sample(candidates, num_to_move)

        # Create interface
        self._create_interface(node)

        # Remove moved ports from the port list
        new_ports = []
        for port in portlist.ports:
            if port not in self.ports_to_move:
                new_ports.append(port)

        # Add interface instance as port
        interface_port = vast.Ioport(vast.Interface(self.interface_name, "iface"))
        new_ports.append(interface_port)

        # Update port list
        portlist.ports = new_ports

        self.modified = True
        return node

    def _is_top_port(self, port):
        """Check if port is a top-level port that shouldn't be moved."""
        if isinstance(port, vast.Ioport):
            port_obj = port.first
            if isinstance(port_obj, (vast.Input, vast.Output, vast.Inout)):
                name = port_obj.name
                # Don't move clock, reset, etc.
                if name.lower() in ("clk", "clock", "rst", "reset", "enable"):
                    return True
        return False

    def _create_interface(self, module):
        """Create an interface definition with the moved ports."""
        interface_ports = []

        for port in self.ports_to_move:
            if isinstance(port, vast.Ioport):
                port_obj = port.first
                if isinstance(port_obj, vast.Input):
                    # Convert Input to Output in interface
                    interface_ports.append(
                        vast.Ioport(vast.Output(port_obj.name, width=port_obj.width))
                    )
                elif isinstance(port_obj, vast.Output):
                    # Convert Output to Input in interface
                    interface_ports.append(
                        vast.Ioport(vast.Input(port_obj.name, width=port_obj.width))
                    )
                elif isinstance(port_obj, vast.Inout):
                    # Keep Inout as is
                    interface_ports.append(port)

        # Create interface definition
        interface_def = vast.InterfaceDef(
            self.interface_name,
            vast.Paramlist([]),
            vast.Portlist(interface_ports),
            [],  # No items inside interface for now
        )

        # Add interface definition before the module
        # This needs to be handled by modifying the parent AST structure
        # which contains both module and interface definitions

        # For now, just print the interface definition code
        codegen = ASTCodeGenerator()
        print("// Generated interface definition")
        print(codegen.visit(interface_def))
        print("// End of interface definition\n")


class RandomlyMoveStateToTaskXform(XformVisitor):
    """
    Move statements from the main always block to a task.

    This transformation helps test task-based design refactoring and
    how designs handle procedural abstraction.
    """

    def __init__(self, xform_to_all=False, random_seed=None):
        super().__init__()
        self.xform_to_all = xform_to_all
        self.found_always = False
        self.task_name = "process_state"
        if random_seed is not None:
            random.seed(random_seed)

    def visit_Always(self, node):
        """Visit always blocks to identify statements to move to a task."""
        if self.found_always:
            return node

        self.found_always = True

        # Get the statement block
        if not isinstance(node.statement, vast.Block):
            return node

        block = node.statement

        # Look for if statements or case statements
        if_stmts = []
        for i, stmt in enumerate(block.statements):
            if isinstance(stmt, vast.IfStatement):
                if_stmts.append((i, stmt))

        if not if_stmts:
            return node

        # Choose an if statement to move to a task
        idx, if_stmt = random.choice(if_stmts)

        # Create task definition
        task_def = self._create_task(if_stmt)

        # Replace the if statement with a task call
        task_call = vast.TaskCall(self.task_name, [])
        block.statements[idx] = task_call

        # Add task to module items
        # This needs to be handled by modifying the parent AST structure

        # For now, just print the task definition code
        codegen = ASTCodeGenerator()
        print("// Generated task definition")
        print(codegen.visit(task_def))
        print("// End of task definition\n")

        self.modified = True
        return node

    def _create_task(self, stmt):
        """Create a task definition containing the given statement."""
        return vast.Task(
            self.task_name,
            vast.TaskPortList([]),  # No ports for now
            vast.Block([stmt]),  # Task body contains the moved statement
        )


class RandomlyChangeRealToShortRealXform(XformVisitor):
    """
    Change real type declarations to shortreal randomly.

    This is a more sophisticated version of RealToShortRealXform
    that closer matches what is shown in the screenshots.
    """

    def __init__(self, design=None, xform_to_all=False, random_seed=None):
        super().__init__()
        self.design = design
        self.xform_to_all = xform_to_all
        self.first_transform = False
        self.var_dict = {}  # Track transformed variables
        if random_seed is not None:
            random.seed(random_seed)

    def visit_ModuleDef(self, node):
        """Process a module definition."""
        if node.items is None:
            return node

        for item in node.items:
            self.visit(item)

        return node

    def visit_Decl(self, node):
        """Process a declaration."""
        if node.list is None:
            return node

        for i, decl in enumerate(node.list):
            if (
                isinstance(decl, vast.Parameter)
                or isinstance(decl, vast.Reg)
                or isinstance(decl, vast.Wire)
            ):
                if hasattr(decl, "type") and decl.type == "real":
                    # Apply transformation logic
                    if not self.first_transform:
                        self.first_transform = True
                        decl.type = "shortreal"
                        self.var_dict[decl] = True
                        self.modified = True
                    elif self.xform_to_all or random.random() < 0.5:
                        decl.type = "shortreal"
                        self.var_dict[decl] = True
                        self.modified = True

        return node


def random_move_rhs_to_function(ast):
    """
    Move right-hand side (RHS) expressions to functions.

    This transformation helps test design modularity and hierarchical
    structuring of expressions.
    """
    # Implementation would be similar to RandomlyMoveStateToTaskXform
    # but focusing on expressions in assignments
    print("Not yet implemented: random_move_rhs_to_function")
    return ast


def randomly_wrap_continue_assign_to_always_block(ast):
    """
    Convert continuous assignments to always blocks.

    This transformation helps test equivalence of behavior between
    continuous assignments and procedural logic.
    """
    # Identify continuous assignments and wrap them in always blocks
    print("Not yet implemented: randomly_wrap_continue_assign_to_always_block")
    return ast


def randomly_move_vars_to_base_classes(ast):
    """
    Move variable declarations to base classes or parent modules.

    This transformation helps test design inheritance and
    hierarchical organization of variables.
    """
    # Move variables from module to a base class
    print("Not yet implemented: randomly_move_vars_to_base_classes")
    return ast


def apply_xform(
    verilog_file, output_file, xform_name, xform_to_all=False, random_seed=None
):
    """
    Apply a specified transformation to a Verilog file.

    Args:
        verilog_file: Input Verilog file path
        output_file: Output Verilog file path
        xform_name: Name of the transformation to apply
        xform_to_all: Whether to apply the transformation to all matching elements
        random_seed: Seed for random operations (for reproducibility)
    """
    print(f"Applying transformation {xform_name} to {verilog_file}")
    print(f"Output will be written to {output_file}")

    # Check if the input file exists
    if not os.path.exists(verilog_file):
        print(f"Error: Input file {verilog_file} does not exist.")
        return

    try:
        # Parse the Verilog file
        print(f"Parsing Verilog file: {verilog_file}")
        parser = VerilogCodeParser([verilog_file])
        ast, directives = parser.parse()
        print("Parsing successful")
    except Exception as e:
        print(f"Error parsing Verilog file: {e}")
        import traceback

        traceback.print_exc()
        return

    # Create a copy of the AST to avoid modifying the original
    ast_copy = copy.deepcopy(ast)

    # Apply the selected transformation
    if xform_name == "real_to_shortreal" or xform_name == "parameter_scaling":
        xform = ParameterScalingXform(xform_to_all, random_seed)
        modified_ast = xform.visit(ast_copy)
    elif xform_name == "move_ports_to_interface":
        xform = RandomlyMovePortsToInterfaceXform(xform_to_all, random_seed)
        modified_ast = xform.visit(ast_copy)
    elif xform_name == "move_state_to_task":
        xform = RandomlyMoveStateToTaskXform(xform_to_all, random_seed)
        modified_ast = xform.visit(ast_copy)
    elif xform_name == "move_rhs_to_function":
        modified_ast = random_move_rhs_to_function(ast_copy)
    elif xform_name == "wrap_assign_to_always":
        modified_ast = randomly_wrap_continue_assign_to_always_block(ast_copy)
    elif xform_name == "move_vars_to_base_classes":
        modified_ast = randomly_move_vars_to_base_classes(ast_copy)
    else:
        print(f"Unknown transformation: {xform_name}")
        return

    # Generate the transformed Verilog code
    codegen = ASTCodeGenerator()
    modified_code = codegen.visit(modified_ast)

    # Write the output file if the AST was modified
    if getattr(xform, "modified", True):
        with open(output_file, "w") as f:
            f.write(modified_code)
        print(f"Transformation applied successfully. Output written to {output_file}")
    else:
        print("No modifications applied to the AST.")


def main():
    parser = argparse.ArgumentParser(
        description="Apply transformations to Verilog code"
    )
    parser.add_argument("verilog_file", help="Input Verilog file")
    parser.add_argument(
        "--output", "-o", default="output.v", help="Output Verilog file"
    )
    parser.add_argument(
        "--xform",
        "-x",
        required=True,
        choices=[
            "real_to_shortreal",
            "move_ports_to_interface",
            "move_state_to_task",
            "randomly_change_real_to_shortreal",
            "move_rhs_to_function",
            "wrap_assign_to_always",
            "move_vars_to_base_classes",
        ],
        help="Transformation to apply",
    )
    parser.add_argument(
        "--all",
        "-a",
        action="store_true",
        help="Apply transformation to all matching elements",
    )
    parser.add_argument(
        "--seed", "-s", type=int, default=None, help="Random seed for reproducibility"
    )

    args = parser.parse_args()

    apply_xform(args.verilog_file, args.output, args.xform, args.all, args.seed)


if __name__ == "__main__":
    main()
