Here is a basic implementation of your requirements using Python and PyVerilog library for Verilog/SystemVerilog parsing, regex pattern matching etc.: 

```python
import pyverilog as pv
from verilog import ast_pb2
import re
import argparse

# Parse arguments from command line.
parser = argparse.ArgumentParser(description='Change bit width of signals')
parser.add_argument('-f', '--file', required=True, help="Input Verilog file")
args = parser.parse_args()

def change_bitwidths():  # Main transformation function that changes the signal sizes in a verilog module/design unit (DU).  
    with open(args.file) as f:    
        content=f.readlines()     
        
    ast = pv.parse('\n'.join([line for line in content if not re.match("^ *$", line)]))  # Parse the file and remove comments/whitespace lines  
      
    module_name, _=ast[0].id().split('.')     // Get name of top-level Verilog entity (module) from AST     
        
    for i in range(len(content)):  # Iterate over the content to find signals and their bit widths.  
        if re.match("^ *(\w+\s*\=)\s*'d.*width\[([0-9]+):[0-9]+\]", content[i]) or \    // Match lines that contain a signal declaration with its new size    
            re.match('(input|output)',content[i],re.I) :  # and bit width specification  
             match = re.search("'(d.*width\[([0-9]+):[0-9]+\])'", content[i].strip())    // Extract the new size from a signal declaration line    
              if not match: continue     
              
            # Get bit width and name of signals  
             _, old_bitwidth, _ = re.match("'(d.*width\[([0-9]+):[0-9]+\])'", content[i].strip()).groups()     // Extract the new size from a signal declaration line   
              if not int(old_bitwidth) == len(ast[1][2:match.span()[-1]]._fields['bits'])/8 or \  # Validate that bit width is syntactically correct  
                 old_bitwidth != match.group().split(' ')[0].replace("'", ''):    // Match the new size with a signal name     continue     
              
             content[i] = re.sub(r'\b%s\b' % (match.groups()[-1]) , '%d\'width['+ match.group().split(' ')[0].replace("'",'').strip(), 2) + '_bits']   // Replace the signal name with new size in a line    
              print(content[i], end="")    # Print updated lines to stdout for verification      return True, content else False.      
```        
This is just an example and does not cover all edge cases or error handling that you might need depending on your specific use case (e.g., file reading errors). Also note this code assumes the input Verilog module/design unit to be a single top-level entity, which may vary in some other contexts as well!
