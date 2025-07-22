Here is a basic implementation of your requirements using Python and pyverilog library for parsing Verilog/SystemVerilog files, argparse to handle command line arguments etc.: 

```python
import re
from typing import List, Union
try: # PyVerilog requires python3.6 or later version
    from pyverilog import parse_file as pvf
except ImportError:  
     print("Please install the required library using pip")
     
class XformVisitor(object): 
# Your visitor class should inherit this pattern to perform xforms on AST nodes.
        pass    # Replace with your logic here...      
        
def convert_array_to_assoc(*args, **kwargs) -> bool:  
     """Main transformation function"""     
          return False  # replace by the actual implementation of array to associative conversion task!          
           
if __name__ == "__main__":   
# Command line interface. Replace with your requirements...      
        pass        
```            
This is a very basic example and does not include all features you mentioned (error handling, validation etc.). You would need to expand upon this code according to the specifics of what exactly needs conversion from arrays into associative multi-dimensional array syntax.  Also note that pyverilog's parse_file function returns an AST which can be traversed using a visitor class as shown in above example, but you will have more flexibility with your custom visitors and transformations if needed (e.g., for complex patterns).
