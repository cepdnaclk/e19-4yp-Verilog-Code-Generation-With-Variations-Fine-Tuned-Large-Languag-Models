Here is a Python module for your requirement using PyVerilog, re (for regex), argparse and ast modules from python standard library to parse Verilog/Systemverilog ASTs in an automated way while renaming FSM state names throughout the whole codebase with new prefix. 

```python
import pyverilog as pv
from typing import List, Tuple
import re
import argparse
import ast

class ExampleVisitor(ast.NodeTransformer):   # Inherits from NodeTransformer to visit nodes in ASTs recursively
    def __init__(self, old_prefix: str , new_prefix:str ):
        self._old = re.compile("^" + old_prefix)     # Compile the regex pattern for matching states with current prefix  
        self._new =  "${"+re.escape(new_prefix).replace('*', '.*')    # Escape new name and replace * to .*, so it can be used in a regular expression 
                                                                         # This is done because Python's re module does not support the use of wildcard (*) character inside regex pattern  
        self.changes_made = []                       # List for storing changes made during transformation   
    
    def visit_Name(self, node: ast.Name):          # Visit Name nodes (Identifiers in Verilog/Systemverilog codebase), rename them if needed 
         match =  self._old.match(node.id)           # If identifier matches the old prefix  
                                                                    
        if match is not None :                         # Rename Identifier, append changes to list and mark as changed   
            node_new = ast.Name(self._new[len(match.group()):],  id=node.id)     
             self.changes_made.append((f"Renamed {node.id} from '{old}' to '''{new}'", (node, node_new)))   # Store the changes made in a list   
            return ast.copy_tree(self._renameRefs([match], [ast.NameConstant('')])) 
        else:                                          # If no match found then just visit children nodes of Name    
          for c in self.generic_visit(node):          
              pass  
                                                                        
    def generic_visit(self, node) -> ast.Node:            # Visit all other ASTs recursively  (Assignments and comparisons etc.)     
        if isinstance(node, list):                        # If a List of nodes found then visit each one  
          for item in node : self._visit_children([item])   
              return None    
         elif hasattr(node,'id'  )and (self.old and re.match("^"+str(getattr(node, 'id')), str(self.old)):   # If identifier matches the old prefix then visit it recursively     
            self._visit_children([ast.copy_tree((re.sub('\n', '', ast.unparse(node).replace(" ", "")))])  return None   
        else :                                            # Else just continue visiting other nodes  
          for c in node:self.__class__.__bases__(c), self._visit_children([ast.copy_tree((re.sub('\n', '', ast
