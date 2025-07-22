#!/usr/bin/env python3
""" Transformation to change a module name from simple_counter to advanced_counter """

from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import NodeVisitor

def transform_module_name(filename, from_name, to_name):
	"""Transform module name in Verilog file"""
	# Parse the input file
	ast, _ = parse([filename])

	# Create a module name transformation visitor
	visitor = ModuleNameVisitor(from_name, to_name)

	# Visit and modify the AST
	visitor.visit(ast)

	# If no module was found, return None
	if not visitor.found_module:
		return None

	# Generate modified source code
	modified_code = ast.tocode()

	return modified_code

class ModuleNameVisitor(NodeVisitor):
	"""AST visitor that identifies and renames modules"""
	def __init__(self, from_name, to_name):
		self.from_name = from_name
		self.to_name = to_name
		self.found_module = False

	def visit_ModuleDef(self, node):
		"""Modify module definition if name matches"""
		if node.name == self.from_name:
			node.name = self.to_name
			self.found_module = True