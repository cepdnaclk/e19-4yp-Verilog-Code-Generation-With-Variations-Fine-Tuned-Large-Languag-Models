```python
import pyverilog.ast as ast
from pyverilog.parser import parse
from pyverilog.ast.utils import *
from re import sub, findall
import argparse


class RenameSignalVisitor(ast.NodeVisitor):
    def __init__(self, old_name, new_name):
        self.old_name = old_name
        self.new_name = new_name

    def visit_Decl(self, node):
        if isinstance(node, ast.Decl) and node.name == self.old_name:
            node.name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.list:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_Assign(self, node):
        if isinstance(node, ast.Assign) and node.lhs[0].name == self.old_name:
            node.lhs[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.rhs:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_Expr(self, node):
        if isinstance(node, ast.Expr) and node.op == "=" and node.lhs[0].name == self.old_name:
            node.lhs[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.rhs:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_Statement(self, node):
        if isinstance(node, ast.Statement) and node.name == self.old_name:
            node.name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.list:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_If(self, node):
        if isinstance(node, ast.If) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_While(self, node):
        if isinstance(node, ast.While) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_For(self, node):
        if isinstance(node, ast.For) and node.init[0].name == self.old_name:
            node.init[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_Case(self, node):
        if isinstance(node, ast.Case) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItem(self, node):
        if isinstance(node, ast.CaseItem) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList2(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList3(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList4(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList5(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList6(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList7(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList8(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList9(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList10(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList11(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].name = self.new_name
            self.changes_made.append(f"Renamed {self.old_name} to {self.new_name}")
        for item in node.then:
            if hasattr(item, "name") and item.name == self.old_name:
                item.name = self.new_name

    def visit_CaseItemList12(self, node):
        if isinstance(node, ast.CaseItemList) and node.cond[0].name == self.old_name:
            node.cond[0].