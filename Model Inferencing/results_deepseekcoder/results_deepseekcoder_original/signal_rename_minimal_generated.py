Here is a basic implementation of your requirements using Python and pyverilog library for Verilog parsing, regex module to perform text transformations etc.: 
```python
import argparse
from typing import List
import re
import sys
try: # PyVerilog requires python3.6 or later version which is not available in all environments (like Jupyter notebook) so we use try/except block for error handling and compatibility check  
    from pyverilog import parse_file, VerilogParsingError 
except ImportError: # if PyVerilog library does not exist then raise an exception. This is a workaround to handle the missing module in environments like Jupyter notebook where it's impossible or impractical for pyverilog import and error handling mechanism are provided here  
    print("PyVerilog could not be imported, please make sure you have installed necessary packages.") 
    sys.exit(1)    
from ast import NodeTransformer # This is a visitor pattern implementation in Python using the AST module from python standard library (ast). It's used to traverse and transform an abstract syntax tree  
class SignalRenameVisitor(NodeTransformer):  // Visiting class for renaming signals. Inherits all methods of NodeTransfomer, which means it can use any method in the base visitor pattern implementation   
def __init__(self, old_name: str , new_name :str) -> None:   // Initialize our instance with necessary parameters 
        self._old_name = re.compile(r'\b' + old_name  + r'\b')    
        # The \w+ matches any word character (equal to [a-zA-Z0-9_]) and the ? after it makes sure we are not matching partial words  
        self._new_name = re.compile(r'.*' + new_name  + r'.*')     // Compile regex for pattern that matches any string containing old name anywhere in a word 
def visit_Assign(self, node):    // Visit Assignment nodes (assignments)  
        if self._old_name.match(node.targets[0]):      // If the target of assignment is our signal we replace it with new one    
            # We use repr() to get a string representation for replacement, which can be used in regexp replacements 
            node.targets[0] = self._new_name(repr(node))   // Replace the target of assignment (signal)   
        return NodeTransformer.visit_Assign(self, node)    
def visit_Call(self, node):      // Visit Call nodes 
         if any((isinstance(arg, self._old_name) for arg in node.args)):   // If the call contains our signal we replace it with new one   
             # We use repr() to get a string representation of replacement which can be used as regexp replacements 
            calls = [self._new_name(repr(arg)).replace('$', '') for arg in node.args]   // Replace the call with new name   
             # We replace all occurances, not just first one    
           return Call(node.func + tuple(calls), node.keywords)  if any((isinstance(arg, self._old_name) for arg in calls)) else NodeTransformer.visit_Call(self, node)   // Return modified call or original non-modified one   
def visit_FunctionDef(self, node):     // Visit Function definition nodes (declarations and assignments etc.) 
        if self._old_name.match(node.name):      // If the name of function is our signal we replace it with new one  
            # We use repr() to get a string representation for replacement, which can be used in regexp replacements   
           node.name = self._new_name(repr(node))  if any((isinstance(stmt, Assign) or isinstance(stmt, Return) for stmt in node.body + [self]) and not (any('$' == c for c in repr(calls).split()) for call in calls: self._old_name.match(arg)) else NodeTransformer.visit
