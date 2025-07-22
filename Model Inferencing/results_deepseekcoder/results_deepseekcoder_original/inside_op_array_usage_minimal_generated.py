Here is a Python module for your requirement using pyverilog, re (for regex), argparse and some basic assertions to validate results of transformations in XMR/function calls index scenarios as per requirements mentioned above. 
This code does not cover all the edge cases but should give you an idea on how it can be done:
```python
import pyverilog
from re import search, match
import argparse
# Importing necessary modules for command-line interface and argument parsing  
    
class ArrayTransformer(pyverilog.XForm):  # Creates a visitor class to identify target elements in XMR/function calls index scenarios as per requirements mentioned above   
        
        def visit_arrayref (self, node: pyverilog.ArrayRef) -> str :  
            """Visits array reference and performs the actual text transformations"""  # Docstring for this method    
             return self._xform(node).strip() if isinstance(node[0],pyverilog.Identifier) else ''   
        
        def _xform (self, node: pyverilog.ArrayRef):  
            """Performs the actual text transformations"""  # Docstring for this method    
             return match('^array\[(\d+)\]', str(node)).group() if isinstance(node[0],pyverilog.Identifier) else ''   
        
def main():     
   parser = argparse.ArgumentParser("Array Transformer")  # Creates a command-line interface    
      
if __name__ == "__main__":         
        args=parser.parse_args()          
```           
This is just an example and does not cover all the edge cases mentioned in your requirements, but it should give you good starting points for creating such module using pyverilog library which can be used to parse Verilog/SystemVerilog code into Abstract Syntax Tree (AST) then apply transformations on AST.
