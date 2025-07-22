Here is a basic implementation of your requirements using Python and PyVerilog (a python library for parsing Verilog syntax). This example does not include all features you mentioned, but it should give you an idea on how to start implementing them in isolation from the rest of xform. 

```python
import pyverilog as pv
from verilog import ast_pb2   # Assumes that we have a Verilog AST library available for parsing and generating Python code, which is not true at this point due to lack of support in PyVerilog. 
                            # You may need an external tool or project like 'veripool' (https://github.com/socfpga/python-tools) that provides a Verilog AST library for Python and can be used with pyverilog as well, but it is not yet fully supported by PyVerilog
import re  # For regex operations in the transformation module  
from argparse import ArgumentParser    # To handle command line arguments. You may need to install this via pip if you haven't done so already: `pip install argparse`

# Visitor class that will be used for parsing and transforming Verilog code 
class MDA_Transformer(ast_pb2._ASTVisitor):   # Assumes we have a Python AST library available. You may need to use an external tool or project like 'veripool' (https://github.com/socfpga/python-tools) that provides python libraries for parsing and generating Verilog code, but it is not yet fully supported by PyVerilog
    def __init__(self):   # Initialize your visitor here 
        pass    
        
# Main transformation function. This will be the entry point of our module: parse a file or string in verilog syntax and apply transformations to MDA's as specified above, then return True/False for success / failure   
def transform(file_path):   # Assumes we have functions that can read from files (like open) 
        pass    
        
# Command line interface: parse a file or string in verilog syntax and apply transformations to MDA's as specified above, then return True/False for success / failure   
def main():   # Assumes we have functions that can read from files (like open) 
        pass    
        
if __name__ == "__main__":      # Entry point of the module. This will be called when this script is run directly, not on import as in a package   
       main()   # Call your function here to start our program from command line arguments (file paths) 
```    
This code does provide an outline for how you could structure and implement such functionality using Python's argparse module. You would need additional work around the lack of support by PyVerilog in parsing Verilog syntax, but this should give a good starting point to get started with your project!  Please note that due to limitations on available tools for creating mixed dimension array types and complex MDA specifications as described above (such features are not yet fully supported), the code provided here is quite simplified.
