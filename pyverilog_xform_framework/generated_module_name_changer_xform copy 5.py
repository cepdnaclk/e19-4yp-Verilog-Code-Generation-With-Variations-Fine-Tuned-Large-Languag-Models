#!/usr/bin/env python3
import sys
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import NodeVisitor

def transform_module_name(filename, from_name, to_name):
	# Parse the input file
	ast, _ = parse([filename])

	# Visitor to modify module name
	class ModuleNameVisitor(NodeVisitor):
		def visit_ModuleDef(self, node):
			if node.name == from_name:
				node.name = to_name

	# Create visitor and walk the AST
	visitor = ModuleNameVisitor()
	visitor.visit(ast)

	# Generate modified source code
	return ast

def main():
	if len(sys.argv) != 2:
		print("Usage: python script.py <input_file>")
		sys.exit(1)

	input_file = sys.argv[1]
	modified_ast = transform_module_name(input_file, "simple_counter", "advanced_counter")

	# Print or write modified code
	print(modified_ast)

if __name__ == '__main__':
	main()