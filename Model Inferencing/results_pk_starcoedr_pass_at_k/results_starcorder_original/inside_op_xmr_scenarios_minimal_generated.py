
"""

import argparse, re, os, sys
from pyverilog import VerilogModule, VerilogParser
from pyverilog.vparser.ast import *


class XMRVisitor(VerilogVisitor):
    """
    Visitor class to find and replace text in the AST

    Attributes:
        self._target_list (list of strings) : List of target elements to search for
        self._replacements (dict of strings)  : Dictionary of replacements to perform
    """

    def __init__(self, target_list, replacements):

        self.target_list = target_list
        self.replacements = replacements


    # Visitor methods
    def visit(self, node):
        
        for target in self._target_list:
            if isinstance(node, target):
                self.visit_target(node)

        return super().visit(node)

    def visit_target(self, node):
        """
        Method to perform the actual text replacements

        Args:
            node (AST node) : Target node to replace

        Returns:
            None
        """
        
        for key in self._replacements.keys():

            # Replace all instances of the target string with the replacement
            node = re.sub(key, self._replacements[key], node)

        return node


def main(args):

    # Create a parser object
    parser = argparse.ArgumentParser()

    # Add arguments to the parser
    parser.add_argument('-i', '--input-file', help='Input file')
    parser.add_argument('-o', '--output-file', help='Output file')
    parser.add_argument('--target-list', nargs='+', help='Target list')
    parser.add_argument('--replacements', nargs=2, action="append", help='Replacements')

    # Parse the arguments
    args = parser.parse_args(args)

    # Check for input file
    if not os.path.isfile(args.input_file):
        print('Input file does not exist!')
        return False

    # Check for output file
    if os.path.exists(args.output_file):

        # Prompt user to overwrite existing file
        choice = input('Output file exists! Overwrite? [y/n]: ')
        
        while True:
            if choice == 'y':
                break

            elif choice == 'n':
                print('Exiting...')
                return False
            
            else:
                choice = input('Invalid option. Try again!')

    # Check for target list
    if not args.target_list or len(args.target_list) < 1:
        print('No target elements specified! Exiting...')
        return False
    
    # Check for replacements
    if not args.replacements or len(args.replacements) != 2:
        print('No replacements specified! Exiting...')
        return False

    # Create a dictionary of replacements
    replacement_dict = dict()

    for target, replacement in zip(args.target_list, args.replacements):

        if not isinstance(replacement, str):
            print('Replacement must be string!')
            return False
        
        else:

            # Check for duplicate keys
            if target in replacement_dict.keys():
                print('Duplicate key detected! Exiting...')
                return False
            
            else:

                # Add the replacement to the dictionary
                replacement_dict[target] = replacement

    # Create a Verilog parser object
    parser = VerilogParser()
    
    # Parse and analyze the input file
    try:
        ast = parser.parse(args.input_file)
        
    except Exception as e:

        print('Error parsing file!')
        return False

    # Create an XMR visitor object to find target elements
    visitor = XMRVisitor(args.target_list, replacement_dict)
    
    # Visit the AST and perform text replacements
    try:
        
        ast = visitor.visit(ast)
        
    except Exception as e:

        print('Error visiting file!')
        return False

    # Write the modified AST to a new file
    try:

        with open(args.output_file, 'w') as f:
            f.write(str(ast))
    
    except Exception as e:
        
        print('Error writing output file!')
        return False

    # Print success message
    print('Success! Output written to {}'.format(args.output_file))

    return True


if __name__ == '__main__':

    main(sys.argv[1:])
