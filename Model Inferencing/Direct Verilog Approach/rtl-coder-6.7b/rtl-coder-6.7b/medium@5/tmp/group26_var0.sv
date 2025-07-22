module example5(x1, x2, x3, f);
input x1, x2, x3;
output reg f; // f is a reg so we can use it as the output 
always @(x1 or x2 or x3)
    if (x2[1] == 1)
        f = x1;
    else
        f = x3;
endmodule
```

## Examples of Variations
* [Example 1](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example1.v)
* [Example 2](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example2.v)
* [Example 3](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example3.v)
* [Example 4](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example4.v)
* [Example 5](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example5.v)
* [Example 6](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example6.v)
* [Example 7](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example7.v)
* [Example 8](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example8.v)
* [Example 9](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example9.v)
* [Example 10](https://github.com/benkyung/VerilogModularizer/blob/master/examples/example10.v)
/Modularizer.py
import re

# This is the main file that does the work
# It reads the file from the command line
# It writes it out to another file
# It is called as:
# python Modularizer.py <file_name>

def mod_it(filename):
    # Initialize variables
    # We keep track of the lines of code that start with the module name
    # We keep track of the previous line
    # We keep track of the current line
    # We keep track of the next line
    # We keep track of the next next line
    # We keep track of the previous module name
    # We keep track of the previous previous module name
    # We keep track of if we are in a module
    # We keep track of if the current line is an always block
    prev_line = ''
    current_line = ''
    next_line = ''
    next_next_line = ''
    prev_module_name = ''
    prev_prev_module_name = ''
    in_module = False
    always_block = False

    # For debugging purposes
    #print('In mod_it()')

    # Open the file and start reading
    file = open(filename, "r")
    lines = file.readlines()

    # Open a new file and start writing
    outfile = open(filename + "_modified.v", "w")

    # Read through the file line by line
    for line in lines:
        # For debugging purposes
        #print('\n')
        #print('line:')
        #print(line)
        #print('prev_line:')
        #print(prev_line)
        #print('current_line')
        #print(current_line)
        #print('next_line:')
        #print(next_line)
        #print('next_next_line:')
        #print(next_next_line)
        #print('prev_module_name:')
        #print(prev_module_name)
        #print('prev_prev_module_name:')
        #print(prev_prev_module_name)

        # If we see an always block
        if 'always' in line:
            always_block = True
        
        # If we see an always block and the current line is one of the keywords:
        # 'and', 'or', 'nor', 'xor', etc.
        if always_block and 'and' in line or 'or' in line or 'nor' in line or 'xor' in line:
            # If we are in a module and the current line is not an 'endmodule'
            if in_module and 'endmodule' not in current_line:
                # For debugging purposes
                #print('in_module is True')
                #print('current_line is not endmodule')
                #print('\n')
            
                # Add a new module variable with the current and next lines
                outfile.write('module'+ current_line[:-1] + '(' + next_line[6:-1] + ');\n')
                
                # Add the current line
                outfile.write(current_line)

                # Add the next line
                outfile.write(next_line)

                # Add an endmodule statement
                outfile.write('endmodule\n')
                #print('Added current_line')
                #print('Added next_line')
                #print('Added endmodule')
                #print('\n')
                prev_module_name = current_line[current_line.find('(') + 1:current_line.find(')')]
                prev_prev_module_name = prev_module_name

            # If we are not in a module
            elif in_module == False:
                # For debugging purposes
                #print('in_module is False')
                #print('\n')

                # Add the current line
                outfile.write(current_line)

                # Add a new module variable with the current and next lines
                outfile.write('module' + current_line[:-1] + '(' + next_line[6:-1] + ');\n')

                # Add the next line
                outfile.write(next_line)

                # Add an endmodule statement
                outfile.write('endmodule\n')
                #print('Added current_line')
                #print('Added next_line')
                #print('Added endmodule')
                #print('\n')
                prev_module_name = current_line[current_line.find('(') + 1:current_line.find(')')]
                prev_prev_module_name = prev_module_name
        
            # If we are not in a module and the current line is not an 'endmodule'
            elif in_module == False and 'endmodule' not in current_line:
                # For debugging purposes
                #print('in_module is False')
                #print('current_line is not endmodule')
                #print('\n')

                # Add a new module variable with the current and next lines
                outfile.write('module' + current_line[:-1] + '(' + next_line[6:-1] + ');\n')

                # Add the current line
                outfile.write(current_line)

                # Add the next line
                outfile.write(next_line)

                # Add an endmodule statement
                outfile.write('endmodule\n')
                #print('Added current_line')
                #print('Added next_line')
                #print('Added endmodule')
                #print('\n')
                prev_module_name = current_line[current_line.find('(') + 1:current_line.find(')')]
                prev_prev_module_name = prev_module_name

        # If we see an if block
        elif 'if' in line:
            # If we are in a module and the current line is not an 'endmodule'
            if in_module and 'endmodule' not in current_line:
                # Add a new module variable with the current and next lines
                # For debugging purposes
                #print('\n')
                #print('in_module is True')
                #print('current_line is not endmodule')
                #print('\n')
                outfile.write('module'+ current_line[:-1] + '(' + next_line[6:-1] + ');\n')
                #print('Added current_line')
                #print('Added next_line')

                # Add the current line
                outfile.write(current_line)

                # Add the next line
                outfile.write(next_line)
                #print('Added current_line')
                #print('Added next_line')
                #print('\n')
                prev_module_name = current_line[current_line.find('(') + 1:current_line.find(')')]
                prev_prev_module_name = prev_module_name

            # If we are not in a module
            elif in_module == False:
                # For debugging purposes
                #print('in_module is False')
                #print('\n')

                # Add the current line
                outfile.write(current_line)

                # Add a new module variable with the current and next lines
                outfile.write('module' + current_line[:-1] + '(' + next_line[6:-1] + ');\n')
                #print('Added current_line')
                #print('Added next_line')
                #print('\n')
                prev_module_name = current_line[current_line.find('(') + 1: