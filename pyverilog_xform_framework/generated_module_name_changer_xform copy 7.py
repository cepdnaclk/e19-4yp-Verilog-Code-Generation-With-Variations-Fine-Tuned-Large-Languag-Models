import sys
from pyverilog.vparser.parser import VerilogParser
from pyverilog.vparser.ast import ModuleDef

def transform_module_name(input_file, output_file):
	# Parse the Verilog file
	parser = VerilogParser()
	ast = parser.parse([input_file])

	# Traverse the AST to find and modify the module name
	def modify_module_name(node):
		if isinstance(node, ModuleDef):
			if node.name == 'simple_counter':
				node.name = 'advanced_counter'
		return node

	# Apply the transformation
	ast = ast[0]
	ast = ast.map(modify_module_name)

	# Write the transformed AST back to a file
	with open(output_file, 'w') as f:
		f.write(str(ast))

def main():
	if len(sys.argv) != 3:
		print("Usage: python script.py <input_file> <output_file>")
		sys.exit(1)

	input_file = sys.argv[1]
	output_file = sys.argv[2]

	transform_module_name(input_file, output_file)
	print(f"Module name transformed and saved to {output_file}")

if __name__ == "__main__":
	main()