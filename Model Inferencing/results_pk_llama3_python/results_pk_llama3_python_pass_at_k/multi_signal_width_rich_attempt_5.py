# Generated by Ollama Llama 3
# Task: multi_signal_width_rich
# Attempt: 5
# Success: False
# Overall Score: 0.552

"""Transform module for xform framework"""

from pyverilog.ast import *
import re

def change_bit_width(ast, signal_names, new_width):
    """Change the bit width of multiple signals at once
    
    Parameters
    ----------
    ast : AST
        The parsed Verilog AST
    signal_names : list
        A list of signal names to be changed
    new_width : int
        New bit width for all signals
    
    Returns
    -------
    bool
        True on success, False on failure
    """
    
    # Create visitor class
    class BitWidthChangeVisitor(Visitor):
        def __init__(self, signal_names, new_width):
            self.signal_names = signal_names
            self.new_width = new_width
            self.changes_made = []
        
        def visit_Decl(self, node):
            if isinstance(node, ArrayDecl) and node.size:
                for item in node.list:
                    if hasattr(item, "name") and item.name in self.signal_names:
                        # Unpack array width
                        unpacked_width = int(re.sub("[^\d]+", "", str(item.width)))
                        
                        # Check new width validity
                        if (unpacked_width < 1 or 
                                not isinstance(node.type, Array) or 
                                node.type.size > unpacked_width):
                            return False
                        
                        self.changes_made.append(f"Unpacked array {item.name} from {node.size} to {unpacked_width}")
                    
                    elif item.width:
                        # Check new width validity
                        if (not isinstance(node.type, Array) or 
                                node.type.size > int(re.sub("[^\d]+", "", str(item.width)))):
                            return False
                        
                        self.changes_made.append(f"Bitwidth of {item.name} changed from {item.width} to {new_width}")
        
        def visit(self, node):
            # Visit children
            for c in node.children():
                self.visit(c)
    
    # Apply visitor
    bit_width_change_visitor = BitWidthChangeVisitor(signal_names, new_width)
    bit_width_change_visitor.visit(ast)

    return True