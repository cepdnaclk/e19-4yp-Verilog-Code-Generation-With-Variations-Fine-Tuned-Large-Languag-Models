Here is a basic implementation of your requirements using Python and PyVerilog library for Verilog parsing, regex to change bit width specification etc.: 

```python
import pyverilog as pv
from argparse import ArgumentParser
import re

class SignalTransformer(pv.XForm):
    """A visitor class that inherits from existing xforms"""
    
    def __init__(self, old_width: int = 0) -> None:  # type hinting for arguments and return types are optional here but recommended to improve readability of code  
        self.old_width = old_width        
            
    @pv.XFormMethod()    
    def visit(self, node):      
            if isinstance(node, pv.SignalDeclaration) and len(str(node)) > 0:  # type hinting for arguments  
                new_name = re.sub('width', 'newWidth', str(node).split(" ")[1])   
                
                match node._children[2]:    
                    case pv.IntType():      
                        old, _  = map(int ,str((re.findall("\d+", new_name))[-3:]))  # get the last three digits as width  
                         if self.old_width != old :    return False    
                    case pv.FixedType():     
                        match (node._children[2]):      
                            case 'signed':       
                                new, _ = map(int ,str((re.findall("\d+", str(new_name))[-3:]))   # get the last three digits as width   
                                 if self.old_width != old : return False    
                    default:  pass     
                
                node._children[2] = pv.IntType()      
                newnode  = ' '.join([str(child) for child in list(map(lambda x,y:(x or y)[0], [new_name + " ", str(old + 1 if old < 3 else int((re.findall("\d+", node._children[2])[-4])) - 5] ,node)))]
                newchild = pv.SignalDeclaration(*newnode)   # create a Signal Declaration with the updated width   
                
            return True    
```     
This is just an example and may not cover all edge cases, but it should give you good starting points for your project: 
- You need to parse Verilog code using PyVerilog. This can be done by calling `pv.parse(code)` where 'code' represents the input verilog file content as a string or filename/file object respectively, and it returns an AST (Abstract Syntax Tree). 
- You need to create your visitor class that inherits from PyVerilog XForm base classes for each type of node you want to visit. The `visit` method is the entry point where all changes are made on nodes based upon their types and attributes, which can be found using methods like: 
    - Visit SignalDeclaration (node): This will call your visitor's logic when a signal declaration occurs in Verilog code  
- You need to use regular expressions for text transformations. The `re` module provides support for regular expression matching operations on strings, and you can find all matches of some pattern within the string using methods like: 
    - re.findall(pattern ,string) which returns a list containing every match in 's' as a sub-list where each element is an occurrence found by `re` module  
    
Please note that this code does not handle all edge cases and may need to be adjusted based on your specific use case, but it should give you the starting point for developing such functionality.  Also remember PyVerilog's AST traversal can lead into a lot of complexities if done correctly as per requirements which is why I have used XForm method decorators and visitor pattern to simplify things further in this example code snippet, but it should be noted that you would need more sophisticated methods for handling all edge cases.
