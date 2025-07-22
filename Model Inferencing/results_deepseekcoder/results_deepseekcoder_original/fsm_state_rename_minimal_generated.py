Here is a basic implementation of your requirements using Python and pyverilog library for parsing Verilog/SystemVerilog files, argparse to handle command line arguments etc.: 
```python
import re
from typing import List
try: # PyVerilog requires python3.6 or later version which is not available in earlier versions like Python2 and it's a requirement for pyverilog library itself so we use try/except block to handle this situation if the environment does not support these libraries then raise an exception 
    from pyverilog import VerilogParser, TranslationUnitKind as TUK_BLOCKS # PyVerilog AST node kind. Blocks are used for parsing and translating verilog code into C++ or SystemC syntax tree nodes which can be visited by a visitor class
except ImportError: 
    raise Exception("Please install pyverilog library using pip command 'pip install pyverilog'") # If the environment does not support these libraries then print an error message and exit.  
    
class FSMStateRenamerVisitor(object): # Visiting class for renaming states in a module 
    def __init__(self, old_prefix: str , new_prefix:str) -> None :# Constructor method to initialize the visitor with prefixes and suffix.  
        self._old_state = re.compile(r'\b' + rf"{re.escape(old_prefix)}"  +  '\b', re.IGNORECASE | re.VERBOSE) # Compile regex for old state pattern, case insensitive and verbose mode
        self._new_state = new_prefix  
    def visitModuleDecl(self , node: 'VerilogParser') -> None :# Visit method to handle module declaration 
         if isinstance (node.parentNode(), TUK_BLOCKS): # If the parent of current block/module decl has kind blocks then only proceed with renaming states in this sub-tree  
             for child in node:   
                 self._renameState(child)# Call rename state method on each children 
def _replaceAllTextInFile (filename : str, pattern , repl): # Helper function to replace all occurrences of a text within file.    
      with open(filename,'r') as f:   content =f.read()    new_content= re.sub(pattern,  repl, content)       return open(filename, 'w').write (new_content ) # Replace and write back to the same filename .        def _renameState(self , node :'VerilogParser') -> None:  
          for i in range((len)(node.children)):# Loop through all children of current state 
              if isinstance (node[i], TUK_BLOCKS): # If the child has kind blocks then only proceed with renaming states within this sub-tree    self._renameState( node [ i ] )# Recursive call to rename each nested block/state.   def main(): 
                  parser = VerilogParser()     args=parser .parse (sys.stdin) # Parse command line arguments and return the result of parsing from std in    if not isinstance(args, list): raise TypeError('Expected argument')# If no input file then print an error message 
                  else:   visitor = FSMStateRenamerVisitor ( args [0] , 'old_state' ) # Create a new instance of the renaming state transformer with old and new prefixes.    parser .visit(args[1], visitor)# Visit AST tree using our newly created Visiting class, pass in reference to current module decl 
                  if not isinstance (parser , VerilogParser): raise TypeError('Expected argument') # If the parsing result does not have kind blocks then print an error message.   else: sys .stdout .write(str((args[1])))# Otherwise, write out to std output file 
              def _main():    parser = VerilogParser()     args=parser .parse (sys.stderr) # Parse command line arguments and return the result of parsing from st err   if not isinstance(args , list): raise TypeError('Expected argument')# If no input file then print an error message 
              else: sys .stdout = open ('output', 'w' )    visitor=FSMStateRenamerVisitor ( args [0] , 'new_state' ) # Create a new instance of the renaming state transformer with old and new prefixes.   parser .visit(args[1], visitor)# Visit AST tree using our newly created Visiting class, pass in reference to current module decl 
              if not isinstance (parser , VerilogParser): raise TypeError('Expected argument') # If the parsing result does not have kind blocks then print an error message.   else: sys .stdout = open ('output', 'w' )    visitor=FSMStateRenamerVisitor(args[0], "new_state")# Create a new instance of renaming state transformer with old and new prefixes 
              parser .visit ( args [1] , visitor) # Visit AST tree using our newly created Visiting class, pass in reference to current module decl.   if not isinstance(parser , VerilogParser): raise TypeError('Expected argument')# If the parsing result does not have kind blocks then print an error message 
              else: sys .stdout = open ('output', 'w' )    visitor=FSMStateRenamerVisitor ( args [0] , "new
