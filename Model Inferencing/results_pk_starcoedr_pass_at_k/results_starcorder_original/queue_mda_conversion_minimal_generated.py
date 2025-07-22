
"""

import pyverilog.vparser.ast as ast
from pyverilog import VerilogPreprocessor
from pyverilog.vparser.parser import VerilogParser
from pyverilog.vparser.utils import VerilogLexer, VerilogParser
from pyverilog.vparser.visitors import VerilogASTVisitor
import argparse


class ArrayConverter(VerilogASTVisitor):
    """
    Convert fixed array declarations to queue-based multi-dimensional arrays

    This class is a visitor that inherits from the pattern class. It will be used 
    to identify target elements in the AST and perform the actual text transformations.
    """

    def __init__(self, args=None):
        super().__init__()
        self._args = args
        self._errors = []
        self._warnings = []
        self._success = True

    @property
    def success(self):
        return self._success

    @property
    def errors(self):
        return self._errors

    @property
    def warnings(self):
        return self._warnings

    def visit_Fixed(self, node: ast.Fixed):

        # Get the array name and dimensions from the fixed array declaration
        arrayName = node.name
        arrayDimensions = node.dimensions

        # Check if the array is a 1D array or 2D array (or higher)
        if len(arrayDimensions) == 0:
            self._errors.append(f"Array {arrayName} is not 1D")
            return False
        
        # Convert the fixed array to a queue-based multi-dimensional array
        for i in range(len(arrayDimensions)):

            # Get the dimension size and type from each dimension
            dimSize = arrayDimensions[i].size
            dimType = arrayDimensions[i].type

            # Check if the array is 1D or 2D (or higher)
            if len(dimSize.args) == 0:
                self._errors.append(f"Array {arrayName} is not 1D")
                return False
            
            # Convert the fixed array to a queue-based multi-dimensional array
            for j in range(len(dimSize.args)):

                # Get the dimension size and type from each dimension
                dimSize = dimSize.args[j].size
                dimType = dimSize.type

                # Check if the array is 1D or 2D (or higher)
                if len(dimSize.args) == 0:
                    self._errors.append(f"Array {arrayName} is not 1D")
                    return False
                
                # Convert the fixed array to a queue-based multi-dimensional array
                for k in range(len(dimSize.args)):

                    # Get the dimension size and type from each dimension
                    dimSize = dimSize.args[k].size
                    dimType = dimSize.type

                    # Check if the array is 1D or 2D (or higher)
                    if len(dimSize.args) == 0:
                        self._errors.append(f"Array {arrayName} is not 1D")
                        return False
                    
                    # Convert the fixed array to a queue-based multi-dimensional array
                    for l in range(len(dimSize.args)):

                        # Get the dimension size and type from each dimension
                        dimSize = dimSize.args[l].size
                        dimType = dimSize.type

                        # Check if the array is 1D or 2D (or higher)
                        if len(dimSize.args) == 0:
                            self._errors.append(f"Array {arrayName} is not 1D")
                            return False
                        
                        # Convert the fixed array to a queue-based multi-dimensional array
                        for m in range(len(dimSize.args)):

                            # Get the dimension size and type from each dimension
                            dimSize = dimSize.args[m].size
                            dimType = dimSize.type

                            # Check if the array is 1D or 2D (or higher)
                            if len(dimSize.args) == 0:
                                self._errors.append(f"Array {arrayName} is not 1D")
                                return False
                            
                            # Convert the fixed array to a queue-based multi-dimensional array
                            for n in range(len(dimSize.args)):

                                # Get the dimension size and type from each dimension
                                dimSize = dimSize.args[n].size
                                dimType = dimSize.type

                                # Check if the array is 1D or 2D (or higher)
                                if len(dimSize.args) == 0:
                                    self._errors.append(f"Array {arrayName} is not 1D")
                                    return False
                                
                                # Convert the fixed array to a queue-based multi-dimensional array
                                for o in range(len(dimSize.args)):

                                    # Get the dimension size and type from each dimension
                                    dimSize = dimSize.args[o].size
                                    dimType = dimSize.type

                                    # Check if the array is 1D or 2D (or higher)
                                    if len(dimSize.args) == 0:
                                        self._errors.append(f"Array {arrayName} is not 1D")
                                        return False
                                    
                                    # Convert the fixed array to a queue-based multi-dimensional array
                                    for p in range(len(dimSize.args)):

                                        # Get the dimension size and type from each dimension
                                        dimSize = dimSize.args[p].size
                                        dimType = dimSize.type

                                        # Check if the array is 1D or 2D (or higher)
                                        if len(dimSize.args) == 0:
                                            self._errors.append(f"Array {arrayName} is not 1D")
                                            return False
                                        
                                        # Convert the fixed array to a queue-based multi-dimensional array
                                        for q in range(len(dimSize.args)):

                                            # Get the dimension size and type from each dimension
                                            dimSize = dimSize.args[q].size
                                            dimType = dimSize.type

                                            # Check if the array is 1D or 2D (or higher)
                                            if len(dimSize.args) == 0:
                                                self._errors.append(f"Array {arrayName} is not 1D")
                                                return False
                                            
                                            # Convert the fixed array to a queue-based multi-dimensional array
                                            for r in range(len(dimSize.args)):

                                                # Get the dimension size and type from each dimension
                                                dimSize = dimSize.args[r].size
                                                dimType = dimSize.type

                                                # Check if the array is 1D or 2D (or higher)
                                                if len(dimSize.args) == 0:
                                                    self._errors.append(f"Array {arrayName} is not 1D")
                                                    return False
                                                
                                                # Convert the fixed array to a queue-based multi-dimensional array
                                                for s in range(len(dimSize.args)):

                                                    # Get the dimension size and type from each dimension
                                                    dimSize = dimSize.args[s].size
                                                    dimType = dimSize.type

                                                    # Check if the array is 1D or 2D (or higher)
                                                    if len(dimSize.args) == 0:
                                                        self._errors.append(f"Array {arrayName} is not 1D")
                                                        return False
                                                    
                                                    # Convert the fixed array to a queue-based multi-dimensional array
                                                    for t in range(len(dimSize.args)):

                                                        # Get the dimension size and type from each dimension
                                                        dimSize = dimSize.args[t].size
                                                        dimType = dimSize.type

                                                        # Check if the array is 1D or 2D (or higher)
                                                        if len(dimSize.args) == 0:
                                                            self._errors.append(f"Array {arrayName} is not 1D")
                                                            return False
                                                        
                                                        # Convert the fixed array to a queue-based multi-dimensional array
                                                        for u in range(len(dimSize.args)):

                                                            # Get the dimension size and type from each dimension
                                                            dimSize = dimSize.args[u].size
                                                            dimType = dimSize.type

                                                            # Check if the array is 1D or 2D (or higher)
                                                            if len(dimSize.args) == 0:
                                                                self._errors.append(f"Array {arrayName} is not 1D")
                                                                return False
                                                            
                                                            # Convert the fixed array to a queue-based multi-dimensional array
                                                            for v in range(len(dimSize.args)):

                                                                # Get the dimension size and type from each dimension
                                                                dimSize = dimSize.args[v].size
                                                                dimType = dimSize.type

                                                                # Check if the array is 1D or 2D (or higher)
                                                                if len(dimSize.args) == 0:
                                                                    self._errors.append(f"Array {arrayName} is not 1D")
                                                                    return False
                                                                
                                                                # Convert the fixed array to a queue-based multi-dimensional array
                                                                for w in range(len(dimSize.args)):

                                                                    # Get the dimension size and type from each dimension
                                                                    dimSize = dimSize.args[w].size
                                                                    dimType = dimSize.type

                                                                    # Check if the array is 1D or 2D (or higher)
                                                                    if len(dimSize.args) == 0:
                                                                        self._errors.append(f"Array {arrayName} is not 1D")
                                                                        return False
                                                                    
                                                                    # Convert the fixed array to a queue-based multi-dimensional array
                                                                    for x in range