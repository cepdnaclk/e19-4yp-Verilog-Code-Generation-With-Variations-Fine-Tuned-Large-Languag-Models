# Generated by Ollama Llama 3
# Task: multi_signal_width_minimal
# Attempt: 10
# Success: False
# Overall Score: 0.492

import pyverilog.ast.tools as asttools
from pyverilog.parser import parse
import re

def transform_signals(self, new_widths):
    # Validate input
    if not isinstance(new_widths, list):
        raise ValueError('new_widths must be a list')
    
    # Parse file for the first time to get syntax tree
    self.ast = parse(self.filename)
    self.transformed_ast = None

    # Initialize counter and visitor class
    self.counter = 0
    self.visitor = Visitor()

    # Traverse AST and update with new widths
    visitor.visit(self.ast)

    return True

class Visitor(asttools.Visitor):
    def visit_declaration(self, node):
        if not isinstance(node.signal, list): 
            raise ValueError('signal must be a list')

        for signal in node.signal:
            # Get the width from the new_widths list
            new_width = self.new_widths[self.counter]
            print(f'Old width: {signal.width}, New width: {new_width}')

            # Check if it's packed or unpacked array
            if isinstance(signal.spec, asttools.DeclarationSpec):
                signal.spec = DeclarationSpec(new_width)
                
            elif isinstance(signal.spec, asttools.ArraySpec): 
                if not isinstance(signal.spec.data_spec, list):
                    raise ValueError('data_spec must be a list')

                for spec in signal.spec.data_spec:
                    if isinstance(spec.size, int):
                        spec.size = new_width

            # Update the width
            signal.width = new_width

            self.counter += 1