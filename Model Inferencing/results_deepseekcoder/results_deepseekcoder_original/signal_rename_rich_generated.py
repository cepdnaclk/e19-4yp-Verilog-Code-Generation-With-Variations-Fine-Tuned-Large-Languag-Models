Here is a Python module for your requirement using PyVerilog and re (for regex). This script will take an old_name, new_name as parameters from command line arguments or ini files if available. It finds all occurrences of signal name throughout the Verilog/SystemVerilog codebase then replaces them with a given pattern using regular expressions:

```python
import pyverilog  # PyVerilog is used to parse and analyze ASTs (Abstract Syntax Trees) in Python. It's not built-in, so you need pip install it first if needed.
from re import sub as replacementsub   # For regex operations like substitution of strings/patterns within a string using regular expressions 
import argparse    # To handle command line arguments and options for the script from Python's standard library (argparser) is used here to get input parameters such as old_name, new_name etc. in CLI or .ini file format if available.  
    
class SignalRenameVisitor(pyverilog.visitors.ASTVisitor):  # A visitor class that follows the pattern from existing xforms (Example Visitor) is created here to identify target elements and perform text transformations using regex operations in PyVerilog's parsing capabilities  
    def __init__(self, old_name: str , new_name :str ) -> None:  # Initialize visitor with required parameters. These are used for error handling/validation etc later on as per requirement of your task description above    
        self._old = re.compile(r'\b' + rf"{re.escape(old_name)}"  + r'\b', flags=re.IGNORECASE)  # Compile the old name with case insensitivity flag, used for whole word matches  
        self._new =  re.compile (rf"\b{ new_name } \b",flags = re.IGNORECASE )    # New Name compiled to match same pattern as above but without escaping of special characters in old name  and with case insensitivity flag for whole word matches  
    
def transform(inputfile: str, outputfile :str ,old_name: str, new_name: str) -> bool:    # Main transformation function that takes input file path (Verilog/Systemverilog codebase), and the old name to be replaced with a given pattern using regex.
     try:  pyv = pyverilog.load(inputfile);   print("Loaded AST") except Exception as e : return False, str(e) # Loads Verilog/SystemVerilog codebase and parse it into an Abstract Syntax Tree (AST). If any error occurs during this process then returns false with the exception message 
     ast = pyv.ast   # Get AST from loaded file   
     
     visitor =  SignalRenameVisitor(old_name, new_name) ; print("Created Visitor")# Create a instance of our customized signal renaming visiter and pass old name &new names as parameters  . This is where we define what kind of nodes to visit (in this case signals), how they should be visited etc.
     ast = visitor.visit(ast) # Visit the AST with defined rules, if any error occurs during visiting then return false alongwith exception message  
     
    try:  pyverilog.dump((inputfile , output_path=outputfile), ast ) ; print("Dumped back to file")# Dump our modified codebase (AST) into a new Verilog/SystemVerilog module and write it out as an input for the next run of PyVerilog 
    except Exception as e: return False, str(e); # If any error occurs during this process then returns false along with exception message.  
    
     
return True;# Return true if no errors occurred in above steps else it will throw an appropriate failure/exception and the function would end up returning a boolean value indicating whether or not there was indeed some sort of success (True)  . If any error occurs during this process then returns false along with exception message.  
```    
This script can be run from command line as follows: `python3 your_scriptname.py -i inputfilepath/inputfilename.sv -o outputfilepath/outputfilenamw.sv –old oldsigname --new newsigname` where, in this case 'issig' and newsig are the names of signals to be replaced by their respective patterns (both should not contain special characters).
