
import pyverilog
import re
from argparse import ArgumentParser
from typing import List, Optional

class InsideOperatorTransformer(pyverilog.VerilogTransformation):
    """
    Transformer for generating test cases for inside operator in different contexts.
    """

    def __init__(self) -> None:
        super().__init__()
        self.inside_operator_regex = re.compile(r"^\s*if\s*\(\s*(.*)\s*inside\s*\((.*)\)\s*\)")
        self.case_statement_regex = re.compile(r"^\s*case\s*\((.*)\)\s*(.+)")
        self.loop_statement_regex = re.compile(r"^\s*for\s*\(\s*(.*)\s*in\s*(.*)\s*\)")
        self.continuous_assign_regex = re.compile(r"^\s*always_comb\s*(.+)")
        self.procedural_block_regex = re.compile(r"^\s*always\s*\((.*)\s*\)")
        self.initial_final_block_regex = re.compile(r"^\s*(initial|final)\s*(.+)")
        self.case_inside_regex = re.compile(r"^\s*case\s*\(\s*(.*)\s*inside\s*\((.*)\)\s*\)")

    def transform(self, file: str) -> bool:
        """
        Transform the given Verilog file to generate test cases for inside operator.

        Args:
            file (str): Path to the Verilog file.

        Returns:
            bool: True if transformation was successful, False otherwise.
        """
        try:
            ast = pyverilog.parse_file(file)
            visitor = InsideOperatorVisitor()
            visitor.visit(ast)
            return True
        except Exception as e:
            print(f"Error while transforming {file}: {e}")
            return False

class InsideOperatorVisitor(pyverilog.VerilogVisitor):
    """
    Visitor class for generating test cases for inside operator in different contexts.
    """

    def visit_module(self, node: pyverilog.ast.Module) -> None:
        """
        Visit a module and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.Module): The module to visit.
        """
        for child in node.children:
            self.visit(child)

    def visit_if_statement(self, node: pyverilog.ast.IfStatement) -> None:
        """
        Visit an if statement and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.IfStatement): The if statement to visit.
        """
        match = self.inside_operator_regex.match(node.condition)
        if match:
            print("Inside operator found in if statement")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_case_statement(self, node: pyverilog.ast.CaseStatement) -> None:
        """
        Visit a case statement and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.CaseStatement): The case statement to visit.
        """
        match = self.case_statement_regex.match(node.condition)
        if match:
            print("Inside operator found in case statement")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_loop_statement(self, node: pyverilog.ast.LoopStatement) -> None:
        """
        Visit a loop statement and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.LoopStatement): The loop statement to visit.
        """
        match = self.loop_statement_regex.match(node.condition)
        if match:
            print("Inside operator found in loop statement")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_continuous_assign(self, node: pyverilog.ast.ContinuousAssign) -> None:
        """
        Visit a continuous assign statement and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.ContinuousAssign): The continuous assign statement to visit.
        """
        match = self.continuous_assign_regex.match(node.condition)
        if match:
            print("Inside operator found in continuous assign")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_procedural_block(self, node: pyverilog.ast.ProceduralBlock) -> None:
        """
        Visit a procedural block and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.ProceduralBlock): The procedural block to visit.
        """
        match = self.procedural_block_regex.match(node.condition)
        if match:
            print("Inside operator found in procedural block")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_initial_final_block(self, node: pyverilog.ast.InitialFinalBlock) -> None:
        """
        Visit an initial/final block and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.InitialFinalBlock): The initial/final block to visit.
        """
        match = self.initial_final_block_regex.match(node.condition)
        if match:
            print("Inside operator found in initial/final block")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

    def visit_case_inside(self, node: pyverilog.ast.CaseInside) -> None:
        """
        Visit a case inside statement and generate test cases for inside operator.

        Args:
            node (pyverilog.ast.CaseInside): The case inside statement to visit.
        """
        match = self.case_inside_regex.match(node.condition)
        if match:
            print("Inside operator found in case inside")
            print(f"Test case 1: {match.group(1)} inside {match.group(2)}")
            print(f"Test case 2: {match.group(2)} inside {match.group(1)}")
        self.generic_visit(node)

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("file", help="Path to the Verilog file.")
    args = parser.parse_args()

    transformer = InsideOperatorTransformer()
    success = transformer.transform(args.file)
    if not success:
        print("Error while transforming file")