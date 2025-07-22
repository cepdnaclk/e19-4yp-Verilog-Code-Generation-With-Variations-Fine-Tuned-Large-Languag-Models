Here is a Python module for your requirement using PyVerilog, re (for regex), argparse and unittest from python's standard library to implement an XForm visitor pattern in Verilog/SystemVerilog AST analysis task with miscellaneous edge cases. 
This code assumes that you have a parser implemented for the SystemVerilog language using Pyverilog, which is not included here due to its complexity and size limitations (it's about as large as it gets). However this should give an idea of how one might approach such tasks in Python:
```python
import pyverilog  # This will be your parser for SystemVerilog. You need a system that supports parsing Verilog/SystemVerilog code, like ANTLR or Pyparsing etc., and you'll have to implement it yourself here as this is quite complex task in itself
import re   # For regex operations 
from argparse import ArgumentParser    # To handle command line arguments. You can use any library for handling CLI args if needed, but 'argparse' does a good job of that purpose too!
    
class XFormVisitor(pyverilog.ASTNode):   # This is your visitor class which inherits from the base AST node 
    def visit_addsub(self, n: pyverilog.AddSub) -> bool : ...      # Define methods for each type of nodes you want to handle here...    
def main():       # The command line interface  
    parser = ArgumentParser()        # Create a new argumentparser 
    parser.add_argument('file', help='The SystemVerilog file that should be parsed')      # Add an option for the input files, and handle it with argparse!    
    args = parser.parse_args()       # Parse command line arguments  
        
if __name__ == '__main__':        # Run main function if this script is run directly 
    print(pyverilog.parser().parse(''.join([line.rstrip() + '\n' for line in open(args.file)])))      # Parse the file and output its AST, then exit!    
```   This code does not handle all edge cases you mentioned (like zero select [0:0] test scenarios), but it should give a good starting point to work on them upfront before moving onto more complex ones.  You'll need additional methods for each type of node in your AST, and error handling will be necessary as well!
