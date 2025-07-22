#!/usr/bin/env python3
""" Transformation to change module name from simple_counter to advanced_counter """

import sys
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import ModuleDef

def transform_module_name(input_file, from_name, to_name):
	# Parse the input file
	ast, _ = parse([input_file])
	
	# Traverse the AST and replace module name
	def visit(node):
		if isinstance(node, ModuleDef) and node.name == from_name:
			node.name = to_name
		for c in node.children():
			visit(c)
	
	visit(ast)
	
	# Generate modified Verilog code
	return ast.to_verilog()

def main():
	if len(sys.argv) != 4:
		print("Usage: python script.py <input_file> <from_name> <to_name>")
		sys.exit(1)
	
	input_file = sys.argv[1]
	from_name = sys.argv[2]
	to_name = sys.argv[3]
	
	modified_code = transform_module_name(input_file, from_name, to_name)
	print(modified_code)

if __name__ == "__main__":
	main()