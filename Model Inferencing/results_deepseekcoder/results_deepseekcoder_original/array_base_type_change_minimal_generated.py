Here is a Python module for your requirement using pyverilog, re (for regex), argparse and ast modules to parse Verilog/SystemVerilog ASTs in order to find array declarations of different base types such as bit or int etc., then replace them with the new type. 
This is a basic implementation that you can further enhance based on your requirements:
```python
import pyverilog
from re import search, sub
from argparse import ArgumentParser   # command-line interface for handling arguments in Python scripting language (argparser)
# ast module to parse the Verilog/SystemVerilog ASTs 
ast = pyverilog.load()   
    
class ArrayTypeTransformer(pyverilog.transformers.Base):   # visitor class that extends from Base of PyVerilog's transforming framework (xform) to identify and replace array types in the codebase     
         def visit_ArrayDecl(self, node: pyverilog.astnodes.ModuleImportedNameRef) -> None : 
             # find Array Declaration with current base type  
            if search('bit', str(node)) or search ('int' ,str(node)):   
                new_base = 'logic' if node else 'byte'     # replace bit to logic and int to byte here. You can add more conditions as per your requirement 
            
               width = 1 << (len([n for n in pyverilog._astnodes.__dict__[node].children]) -2)   # handle the new type appropriately with respect of its length, you may need a different logic to calculate it based on node's children. This is just an example
            
               if 'name_of_signal' in str(pyverilog._astnodes.__dict__[node].children):  # replace signal name here as per your requirement  
                 new = sub('(.*)', lambda m: f"{new_base}_{m.group()}", node)    # use regex to perform the actual text transformations, you may need a different logic based on how and where signals are used in code 
               else :    
                return False   # Return false if no signal is found with new base type or replaced successfully otherwise true (failure). You can add more conditions as per your requirement.   
            
            node.__children__ = [new] * len(node)      # replace the old array declaration in AST  and update it here  
         return None    
         
def main():      
        parser=ArgumentParser()           # command-line interface for handling arguments (argparse module).   
                                          # Add your customizations as per requirement. For example, you can add an argument to specify the file name or directory path etc  .  
         args =parser.parse_args()     
          if not args.file:    
              parser.error("Must supply a verilog source filename")    # error handling for missing arguments (argsparser)      
           try :       
               ast.transform(ArrayTypeTransformer())  # apply the visitor to AST  
           except Exception as e:     
                print('Error occurred while transforming', str(e))     # exception catching and printing an error message if any occurs   
          else :      
              pyverilog._astnodes.__dict__[node].print()  # If no errors, then just dump the AST for verification.  
           return True     
if __name__ == '__main__':    
        main()        
```
This is a basic implementation and you may need to adjust it according your requirements such as handling different array dimensions or signals etc., error checking in case of invalid base types, signal names replacement logic based on how they are used within the codebase.  Also note that pyverilog's AST manipulation can be complex depending upon what kind and where you want to change (e.g changing width/dimension), so this is a very basic example only for your requirement description above, further enhancements may need more specific handling as per requirements of the xform framework pattern in pyverilog library 
(https://pyverilog-asttransformer.readthedocs.io). You can use `pip install` to add these modules into Python environment if not already installed:  ```python -m pip install PyVerilog argparse ast re``` . Also, you need a verilog source file for the transformation process as command line argument (file name or path) is required.
