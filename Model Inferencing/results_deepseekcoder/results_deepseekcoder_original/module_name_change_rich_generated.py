Here is a Python module for your requirement using PyVerilog, re (for regex), argparse and ast modules from python standard library to parse Verilog/Systemverilog ASTs in order to find declarations of old names within them as well as replace the name with new one. 

```python
import pyverilog
from typing import List, Tuple
import re
import argparse
import ast

class ExampleVisitor(pyverilog.ASTVisitor):   # Inherits from AST visitor pattern for xform framework task
    def __init__(self, old_name: str , new_name :str  ) -> None:
        self._old_module = pyverilog.ModuleRef(pyverilog.QualifiedName('', ''), '', []) if not hasattr(self,'__current') else getattr(self.__current, '_parent').children()[-1] # Get current module parent (if exists)
        self._new_module = pyverilog.ModuleRef((pyverilog.QualifiedName('', ''), new_name), '', []) if not hasattr(self,'__old') else getattr(self.__old, '_parent').children()[-1] # Get old module parent (if exists)
        self._current = None  # Current node to visit and change name in AST. Initially set as current of visitor instance itself for first time visiting the tree  
        
    def start_visit(self,node:pyverilog.ASTNode):    
       if isinstance (node , pyverilog._Module) :  # Checking node type and name match with old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._old , pyverilog.ModuleRef) :  # Checking old module's names in case of a declaration found within file then change the parent reference to new one else keep it as current  
            self.__current = node   
        return super().start_visit(node=node,**kwargs )    
       if isinstance (self._new , pyverilog.ModuleRef) :  # Checking old module's names in