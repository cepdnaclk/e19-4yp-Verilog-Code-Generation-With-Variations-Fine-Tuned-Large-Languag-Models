#!/usr/bin/env python3
""" Transformation to change module name from simple_counter to advanced_counter """

import sys
import re
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_module_name(input_file, from_name, to_name):
	"""Transform module name using AST"""
	ast, _ = parse([input_file])

	class ModuleNameVisitor(NodeVisitor):
		def visit_ModuleDef(self, node):
			if node.name == from_name:
				node.name = to_name
				print(f"Changed module name from '{from_name}' to '{to_name}'")

	visitor = ModuleNameVisitor()
	visitor.visit(ast)

	return ast

def unparse_modified_ast(ast):
	"""Convert modified AST back to Verilog"""
	from pyverilog.vparser.dtypevisitor import DTYPEVisitor
	from pyverilog.vparser.unparser import Unparser

	dtype_visitor = DTYPEVisitor()
	dtype_visitor.visit(ast)

	output = []
	unparser = Unparser(output)
	unparser.visit(ast)
	return '\n'.join(output)

def main():
	input_file = 'simple_counter.v'  # Input Verilog file
	modified_ast = transform_module_name(input_file, 'simple_counter', 'advanced_counter')
	modified_verilog = unparse_modified_ast(modified_ast)
	
	# Write modified Verilog back to file
	with open('advanced_counter.v', "w") as f:
		f.write(modified_verilog)

if __name__ == '__main__':
	main()