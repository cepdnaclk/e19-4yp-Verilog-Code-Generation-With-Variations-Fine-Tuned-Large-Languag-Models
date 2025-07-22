#!/usr/bin/env python3
"""
Xform to rename a module from simple_counter to advanced_counter
"""

import re
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import *

def transform_module_name(code, from_name='simple_counter', to_name='advanced_counter'):
	"""
	Transform module name from from_name to to_name

	Args:
		code (str): Input Verilog source code 
		from_name (str): Original module name
		to_name (str): New module name

	Returns:
		str: Modified Verilog source code with module name changed
	"""
	# Replace module declaration
	code = re.sub(
		rf'module\s+{from_name}\s*\(',
		f'module {to_name} (',
		code
	)

	return code

# Metadata for the xform
XFORM_METADATA = {
	"name": "module_name_rename",
	"description": "Rename module from simple_counter to advanced_counter",
	"keywords": [
		"rename_module", 
		"simple_counter", 
		"advanced_counter", 
		"module_name_change"
	],
	"args": {
		"from_name": {
			"help": "Original module name",
			"default": "simple_counter",
			"required": False
		},
		"to_name": {
			"help": "New module name", 
			"default": "advanced_counter",
			"required": False
		}
	}
}