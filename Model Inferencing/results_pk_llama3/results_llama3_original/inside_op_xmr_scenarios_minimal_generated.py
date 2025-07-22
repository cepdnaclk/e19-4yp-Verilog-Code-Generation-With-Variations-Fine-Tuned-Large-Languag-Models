Here is a Python module that performs the required task:

```python
import pyverilog
import re
import argparse

class XMRVisitor(pyverilog.ast.NodeVisitor):
    def __init__(self, root):
        self.root = root
        self.xmr_scenarios = []

    def visit_module(self, node):
        if node.name.startswith('xmr_'):
            xmr_scenario = {
                'name': node.name,
                'hierarchy': [node.name],
                'interfaces': []
            }
            for child in node.children:
                if isinstance(child, pyverilog.ast.Interface):
                    xmr_scenario['interfaces'].append({
                        'name': child.name,
                        'virtual': child.virtual
                    })
            self.xmr_scenarios.append(xmr_scenario)

    def visit_interface(self, node):
        if node.virtual:
            for port in node.ports:
                if re.match(r'^xmr_[a-zA-Z_][a-zA-Z0-9_]*$', port.name):
                    xmr_scenario = next((s for s in self.xmr_scenarios if s['name'] == port.name), None)
                    if xmr_scenario:
                        xmr_scenario['hierarchy'].append(node.name)

    def visit_package(self, node):
        for child in node.children:
            if isinstance(child, pyverilog.ast.Module):
                self.visit_module(child)

def transform_xmr(root):
    visitor = XMRVisitor(root)
    visitor.visit(root)
    return visitor.xmr_scenarios

def main():
    parser = argparse.ArgumentParser(description='XMR Transformation')
    parser.add_argument('input_file', help='Input Verilog file')
    args = parser.parse_args()

    with open(args.input_file, 'r') as f:
        root = pyverilog.parser.Parser(f.read()).parse_file().root

    xmr_scenarios = transform_xmr(root)

    if not xmr_scenarios:
        print('No XMR scenarios found.')
    else:
        for scenario in xmr_scenarios:
            print(scenario)

if __name__ == '__main__':
    main()
```

This module defines a `XMRVisitor` class that inherits from `pyverilog.ast.NodeVisitor`. The visitor class is designed to identify and extract XMR scenarios from the input Verilog file. It uses regular expressions to match interface names and port names that start with 'xmr_'.

The `transform_xmr` function takes the root node of the parsed Verilog file as input, creates an instance of the `XMRVisitor`, and calls its `visit` method to traverse the AST. The function returns a list of XMR scenarios found in the input file.

The `main` function uses the `argparse` library to parse command-line arguments, reads the input Verilog file using PyVerilog, and calls the `transform_xmr` function to generate the XMR scenarios. It then prints the results to the console.

To use this module, save it as a Python file (e.g., `xform.py`) and run it from the command line:
```
$ python xform.py input_file.v
```
Replace `input_file.v` with the name of your Verilog file. The script will print the XMR scenarios found in the file to the console.

Note that this module assumes that the input Verilog file contains modules, interfaces, and packages with names that start with 'xmr_'. You may need to modify the regular expressions used in the `XMRVisitor` class to match your specific use case.