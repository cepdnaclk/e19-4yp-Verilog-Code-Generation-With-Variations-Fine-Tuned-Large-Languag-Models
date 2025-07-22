module d_ff (input d, clk, s, r, output reg q, q_b );
always @( s ) begin : force_a_1
if ( s inside {0,1,2,3} )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( r ) begin : force_a_0
if( r )
begin
end else begin
deassign q;
deassign q_b;
end
end
always @( posedge clk ) begin : clocked
end
endmodule
Note:
Do not use `assign` or `initial` blocks inside `always` blocks, instead use `always_comb` and `always_ff` blocks for sequential and combinational logic respectively.

# 3. Verilog Equivalents of C/C++ Data Types

 1. char: integer or bit string 1 byte 8 bits 2. int: integer 1 byte 8 bits 3. unsigned: integer 1 byte 8 bits 4. short int: integer 2 bytes 16 bits 5. long: integer 4 bytes 32 bits 6. long long: integer 8 bytes 64 bits 7. float: real number 1 byte 8 bits 8. double: real number 2 bytes 16 bits 9. unsigned long long: integer 8 bytes 64 bits 10. bool: integer 1 byte 8 bits 

# 4. Verilog Compiler Options

 1. `--lint=<value>` sets the behavior of the lint tool. Can be used to specify `pedantic` or `error`. 2. `--timescale=<scale>` sets the timescale used by synthesizers. Use the format `<num><unit>`, where `<num>` is a positive or negative integer, and `<unit>` is one of the following: `ps` (1/1e-12 seconds), `ns` (1/1e-9 seconds), `us` (1/1e-6 seconds), `ms` (1/1e-3 seconds), `s` (1/1 second), `m` (60 seconds), `h` (60 minutes). 3. `-o <filename>` saves the output of the compiler to a file instead of standard output. Can also be used to set the output filename. 4. `-s <filename>` starts the simulator for the output file. 5. `-l <filename>` sets the output of the synthesizer as a file instead of standard output. Can also be used to set the output filename. 6. `-f` outputs the Verilog code to an intermediate file instead of the target file. 7. `--no-string-concatenation` disables string concatenation. 8. `--check-semantics` enables synthesis checks. Note: The `pedantic` option is deprecated since Verilog 2012.

# 5. Verilog Compiler Warnings

 1. `always_comb`, `always_ff`, `initial`, `begin`, and `end` are deprecated. Use `always_comb`, `always_ff`, `always`, `begin`, or `endblock` instead. 2. `always_ff` is deprecated. Use `always_ff` with a sensitivity list, or `always` with a sensitivity list, or `always @*` instead. 
Note:
Use `always @*` to handle combinatorial logic.
Example:
module d_ff (input d, clk, s, r, output reg q, q_b );
always @* begin
q <= d;
end
endmodule
3. Ports with a `wire` type are deprecated. Use only `bit` or `logic` instead.
 4. The timescale option is deprecated. Use the `specify` block instead. 5. Combinational logic in `always` blocks should use `always_comb` or `always @*` instead. 6. Sequential logic in `always` blocks should use `always_ff` instead.

# 6. Verilog Preprocessor Directives

 1. `#include <filename>` includes the contents of filename at the location of the directive. 2. `#include "filename"` includes the contents of filename at the location of the directive using the current search path. 3. `#ifndef <ident>` evaluates to true if the macro ident is undefined. 4. `#define <ident>` defines the macro ident to be the string given by its arguments. 5. `#define <ident>(<args>) <replacement>` defines the macro ident to be replaced by the replacement list when it is used. 6. `#define <ident> <replacement>` defines the macro ident to be replaced by the replacement list when it is used. 7. `#if <expr>` evaluates to true if the expression is nonzero. 8. `#ifdef <ident>` evaluates to true if the macro ident is defined. 9. `#else` is a directive used within #if directives to indicate that the following #endif directive is part of a conditional block. 10. `#endif` ends the current conditional block. 11. `#undef <ident>` undefines a macro. 
Note:
1. `ifdef`, `ifndef`, and `else` can be used around any block of code. `if` can only be used around a statement. `else` must be used after `#endif`.
2. `#define` defines the macro to be a string instead of a list.
Example:
module d_ff (input d, clk, s, r, output reg q, q_b );
#ifndef PI
#define PI 3.14
#endif
#define my_value 5
#define my_string "hello world"
endmodule
#ifdef PI

#ifndef PI
#define my_value 5
#endif
#else
// do something else
#endif
1. `#include` can also be used to include files in multiple directories.
Note:
1. Use `include` to insert libraries. Use `import` to insert source files.
2. Use `import` to insert directories. Use `include` to insert files.
3. Use double quotes to include source files.
4. Use single quotes to include libraries.
5. Use double quotes to include directories.
6. Use single quotes to include libraries.

# 7. Verilog Verilog-2001 Features

## 7.1. Verilog 2001 Features

 1. `localparam` is a storage modifier which declares a parameter that can be used within the same module only. 2. `parameter` is a storage modifier which declares a parameter. A parameter can be used in any module. 3. `automatic` is a storage modifier which declares an automatic variable. An automatic variable is declared in a block. 4. `tri` and `triand` are storage modifiers which are used to specify that a variable should be tristate, tristated, or tri-and. 5. `supply0` and `supply1` are storage modifiers which are used to specify that a variable should be a supply0 and supply1. 6. `wand` and `wor` are storage modifiers which are used to specify that a variable should be wand or wor. 7. `wandand` and `woror` are storage modifiers which are used to specify that a variable should be wand and or. 8. `wandnand` and `wornand` are storage modifiers which are used to specify that a variable should be wand nand. 9. `wornor` and `wandnor` are storage modifiers which are used to specify that a variable should be wand nor. 10. `wandor` and `wornand` are storage modifiers which are used to specify that a variable should be wand or nand. 11. `wandnor` and `wornor` are storage modifiers which are used to specify that a variable should be wand nor. 12. `wandnor` and `woror` are storage modifiers which are used to specify that a variable should be wand nor. 13. `wandnor` and `woror` are storage modifiers which are used to specify that a variable should be wand nor. 14. `wandnor` and `woror` are storage modifiers which are used to specify that a variable should be wand nor. 15. `wandnor` and `woror` are storage modifiers which are used to specify that a variable should be wand nor. 
# 8. Verilog Verilog-2005 Features

## 8.1. Verilog 2005 Features

 1. The `always_comb`, `always_ff`, `always`, `begin`, and `endblock` keywords are used to mark the start and end of an always block. 2. The `$display` and `$fdisplay` statements are used to print to the console on a simulation run. 3. The `$strobe` and `$strobe_off` statements are used to generate a clock pulse to a signal. 4. The `$finish` statement is used to end a simulation. 5. The `$time` statement is used to print the simulation time. 6. The `$realtime` statement is used to print the real time.

## 8.2. Verilog 2005 Features