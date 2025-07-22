Here is a Python module that performs the task of changing a module name throughout a Verilog file:
```python
import pyverilog
import re
import argparse

class ModuleRenamer(pyverilog.visitors.PatternVisitor):
    def __init__(self, old_name, new_name):
        self.old_name = old_name
        self.new_name = new_name

    def visit_Module(self, module):
        if module.name == self.old_name:
            module.name = self.new_name
            return True
        return False

class RenameModule(xform.XForm):
    def __init__(self, old_name, new_name):
        super().__init__()
        self.module_renamer = ModuleRenamer(old_name, new_name)

    def apply(self, ast):
        self.module_renamer.visit(ast)
        return True

def main():
    parser = argparse.ArgumentParser(description='Rename a module in a Verilog file')
    parser.add_argument('old_name', help='Old module name to rename')
    parser.add_argument('new_name', help='New module name')
    parser.add_argument('input_file', help='Input Verilog file')
    parser.add_argument('output_file', help='Output Verilog file')

    args = parser.parse_args()

    with open(args.input_file, 'r') as input_file:
        verilog_code = input_file.read()

    ast = pyverilog.parse.verilog_ast(verilog_code)

    xform = RenameModule(args.old_name, args.new_name)
    if not xform.apply(ast):
        print('Error: Module renaming failed')
        return 1

    with open(args.output_file, 'w') as output_file:
        output_file.write(pyverilog.print.verilog_ast(ast))

    return 0

if __name__ == '__main__':
    import sys
    sys.exit(main())
```
Here's a breakdown of the code:

* The `ModuleRenamer` class is a visitor that inherits from `pyverilog.visitors.PatternVisitor`. It takes two arguments: `old_name` and `new_name`, which are used to rename modules.
* The `visit_Module` method checks if the current module matches the old name, and if so, renames it to the new name. If not, it returns `False`.
* The `RenameModule` class is an xform that takes two arguments: `old_name` and `new_name`. It creates a `ModuleRenamer` instance and applies it to the AST.
* The `main` function uses `argparse` to parse command-line arguments. It reads the input Verilog file, parses it using PyVerilog, applies the xform, and writes the transformed code to an output file.

To use this module with the xform framework, simply add it to your xform pipeline:
```python
import xform

xform_pipeline = xform.XFormPipeline()
xform_pipeline.add(RenameModule('old_name', 'new_name'))
```
This will rename all occurrences of `old_name` to `new_name` in the input Verilog file.