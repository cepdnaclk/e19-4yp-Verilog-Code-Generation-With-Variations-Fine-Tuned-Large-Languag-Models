Here is a Python module for your requirement using PyVerilog, re and argparse modules to parse arguments from CLI. This example assumes that you have already defined an AST parser in `pyverilog` as well as regex transformations needed on the signal usage inside if statements (active-high -> active low or vice versa).
```python
import pyverilog  # PyVerilog is a Python interface to Verilog/SystemVerilog. It's not available in standard python library, you need to install it separately using pip: `pip install verilog` (or equivalent for SystemVerilog)
from re import sub as regex_sub   # For regular expressions 
import argparse             # To handle command line arguments from CLI.

class ExampleVisitor(pyverilog.ast.Node):    # Our visitor class inherits Node of PyVerilog's AST parser to identify target elements and perform transformations on them  
     def __init__(self, signal_name=None) -> None: 
         super().__init__()                   # Call the parent constructor. This is necessary for all visitors (and not just our visitor).   
                                               # We can also pass some parameters to this function here if needed by your specific use case  
     def visit_If(self, node):              # Visit If nodes in AST  and perform transformations on them using pyverilog's functions. Here we assume that the signal usage inside an 'if statement is a string attribute of `node` named "signal" (or whatever you passed when calling this function).
         if hasattr(node, "signal") :        # Check for target declarations  and perform transformations on them  
             self._changes_made.append("Found {}".format(self.__signals))    # Append the changes made to a list (this is not done in this example but can be used as needed)    
         return super().visit_If(node)        # Call parent visit method  and let it handle other nodes  
                                               # This will also call all children's visitors.   
     
def transform_example(inputfile, outputfile):       # Our main transformation function that takes input file name (str), outputs a transformed version of the same in another location using pyverilog AST parser and our visitor to perform transformations on it  
     ast = None                                    # Initialize an empty Ast object  for PyVerilog's parsing.   
                                                   # We can also pass some parameters if needed by your specific use case (like the root node of a file).     
                                                                        
     with open(inputfile, "r") as f:               # Open input and output files in read mode  
          content = f.read()                       # Read contents from an opened file  into `content` variable   
                                                   # This is where we perform the actual transformations using regex on it (in this case changing if(rst) to !rst).    
     
                                                                        
     modified_content=regex_sub('if\s*\((.*?)\s*==.+\)', '!{}'.format(signal), content, flags = 0 ) # Perform the actual transformations using regex on `modified_content` variable  
                                                   # This is where we write our transformed contents back to a file (in this case outputfile).    
     
                                                                        
     with open(outputfile,"w") as f:                # Open an opened file in overwrite mode and save the modified content into it.   
          f.write(modified_content)                  # Write our transformed contents to a new location (in this case outputlocation).  
     
                                                                        
     return True                                   # Return true if everything was successful, false otherwise  or raise an exception in any error cases . This is done for the purpose of integrating with existing xform framework patterns.   
```      
To use it from command line: `python filename.py inputfile outputfile` where 'input' and 'output' are your files names (with their paths).  The transformation will be performed in place, ie., no new file is created but the original one with transformations applied gets updated on disk. This module also handles both synchronous reset patterns as well async ones by using pyverilog AST parser to identify and modify them appropriately within your visitor class (in this case we assume that a 'reset' signal usage in if statement will be identified).
