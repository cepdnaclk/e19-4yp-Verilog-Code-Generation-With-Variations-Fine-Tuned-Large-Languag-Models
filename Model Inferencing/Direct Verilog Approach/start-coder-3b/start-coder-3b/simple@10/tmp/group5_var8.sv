module dff_p(output logic do, input logic di, input logic clk);
  logic [0:0] dout;
  initial do=0;
  always @(posedge clk) begin
    if(di) begin
      dout <= 1'b1;
    end else begin
      dout <= 0;
    end
  end
  assign do = dout;
endmodule
```
## How to use
### Prerequisites
- The file `test_bench.sv` must be in the working directory and the path to this file must be added to the `TOP_LEVEL_SOURCES` field of the Makefile.

### Running
- Run `make` to generate the executable `test_bench`
- Run `make sim` to run the simulation. The result will be written to the file results.txt./p4.py
# 
import sys
from pyparsing import *

# A function that takes in a variable name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_varname(name):
    return name.lower().replace(' ', '_')

# A function that takes in a module name and converts it to lowercase, underscore-separated, and an extension of sv
# Returns the converted name
def convert_module_name(name):
    return name.lower().replace(' ', '_') + '.sv'

# a function that takes in a module name and converts it to lowercase, underscore-separated, and an extension of v
# Returns the converted name
def convert_module_name_vhdl(name):
    return name.lower().replace(' ', '_') + '.v'

# A function that takes in a list of tokens and returns a dictionary of the tokens as key, and their converted names as value
# Returns a dictionary containing tokens and their converted names
def convert_token_list(token_list):
    return dict(map(lambda x : (convert_varname(x[0]), convert_varname(x[1])), token_list))

# A function that converts a module name to a module declaration
# Returns a string containing the module declaration 
def convert_module_declaration(module_name):
    return'module'+ convert_module_name(module_name) + '(clk_in);'

# A function that takes in an input name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_input_name(name):
    return name.lower().replace(' ', '_')

# A function that takes in an output name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_output_name(name):
    return name.lower().replace(' ', '_')

# A function that takes in an internal name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_internal_name(name):
    return name.lower().replace(' ', '_')

# A function that takes in an input declaration and converts it to a converted input name
# Returns the converted input name
def convert_input_declaration(input_name):
    return convert_input_name(input_name)

# A function that takes in an output declaration and converts it to a converted output name
# Returns the converted output name
def convert_output_declaration(output_name):
    return convert_output_name(output_name)

# A function that takes in an internal declaration and converts it to a converted internal name
# Returns the converted internal name
def convert_internal_declaration(internal_name):
    return convert_internal_name(internal_name)

# A function that takes in an input declaration and converts it to an input declaration with a converted name
# Returns an input declaration with a converted name
def convert_input_declarations(input_declaration):
    return convert_input_name(input_declaration) +'inout'

# A function that takes in an output declaration and converts it to an output declaration with a converted name
# Returns an output declaration with a converted name
def convert_output_declarations(output_declaration):
    return convert_output_name(output_declaration) +'inout'

# A function that takes in an internal declaration and converts it to an internal declaration with a converted name
# Returns an internal declaration with a converted name
def convert_internal_declarations(internal_declaration):
    return convert_internal_name(internal_declaration) +'out'

# A function that takes in a clock declaration and converts it to a converted clock name
# Returns a clock declaration with a converted name
def convert_clock(clock):
    return convert_input_name(clock)

# A function that takes in a state variable name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_state_var_name(name):
    return name.lower().replace(' ', '_')

# A function that takes in a state declaration with a state variable name and converts it to an output declaration with a converted name
# Returns a state declaration with the converted output name
def convert_state_var_declaration(state_var_declaration):
    return convert_output_declaration(state_var_declaration)

# A function that takes in a state declaration with a state variable name and converts it to an output declaration with a converted name
# Returns a state declaration with the converted output name
def convert_state_var_declarations(state_var_declarations):
    return convert_output_declarations(state_var_declarations)

# A function that takes in an input declaration and converts it to a converted input name
# Returns a converted input name
def convert_input_declaration_only(input_declaration):
    return convert_input_name(input_declaration)

# A function that takes in an output declaration and converts it to a converted output name
# Returns a converted output name
def convert_output_declaration_only(output_declaration):
    return convert_output_name(output_declaration)

# A function that takes in an internal declaration and converts it to a converted internal name
# Returns a converted internal name
def convert_internal_declaration_only(internal_declaration):
    return convert_internal_name(internal_declaration)

# A function that takes in a state declaration with a state variable name and converts it to an output declaration with a converted name
# Returns a state declaration with the converted output name
def convert_state_var_declaration_only(state_var_declaration):
    return convert_state_var_name(state_var_declaration)

# a function that takes in a list of tokens and returns a dictionary of the tokens as key, and their converted names as value
# Returns a dictionary containing tokens and their converted names
def convert_token_list_vhdl(token_list):
    return dict(map(lambda x : (convert_varname_vhdl(x[0]), convert_varname_vhdl(x[1])), token_list))

# A function that takes in a variable name and converts it to lowercase, underscore-separated, and an extension of vhdl
# Returns the converted name
def convert_varname_vhdl(name):
    return name.lower().replace('-', '_').replace(' ', '_')

# A function that takes in a module name and converts it to lowercase, underscore-separated, and an extension of vhdl
# Returns the converted name
def convert_module_name_vhdl(name):
    return name.lower().replace(' ', '_') + '.vhd'

# A function that takes in an input name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_input_name_vhdl(name):
    return name.lower().replace(' ', '_')

# A function that takes in an output name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_output_name_vhdl(name):
    return name.lower().replace(' ', '_')

# A function that takes in an internal name and converts it to lowercase and underscore-separated
# Returns the converted name
def convert_internal_name_vhdl