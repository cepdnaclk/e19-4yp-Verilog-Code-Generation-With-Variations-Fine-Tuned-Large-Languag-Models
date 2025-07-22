def transform_module_name(verilog_code, from_name='simple_counter', to_name='advanced_counter'):
	"""
	Transform the module name from 'from_name' to 'to_name'

	Args:
		verilog_code (str): Original Verilog module code
		from_name (str): Original module name
		to_name (str): New module name

	Returns:
		str: Modified Verilog module code with new module name
	"""
	import re

	# Replace module declaration
	modified_code = re.sub(
		r'module\s+' + re.escape(from_name),
		f'module {to_name}',
		verilog_code
	)

	return modified_code