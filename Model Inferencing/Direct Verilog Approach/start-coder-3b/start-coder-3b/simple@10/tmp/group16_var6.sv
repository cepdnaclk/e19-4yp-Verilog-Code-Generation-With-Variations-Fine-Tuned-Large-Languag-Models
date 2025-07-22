module orfr_tst; // Testbench for OR gate with force/release
  struct io {   logic a, b, c;   logic [3:0] string; };
  io din, dout;
  initial begin din.a = bit_or_fr_rl(0,0,0); din.b = bit_or_fr_rl(0,1,1); din.c = bit_or_fr_rl(1,0,1); #1 $dumpfile("inputs.v"); foreach (din.a, din.b, din.c) $dumpvars(1, din); #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(din,dout); // Instantiate the module containing force/release
endmodule
### Expected Behavior:
- All the inputs get dumped to a file named inputs.v
- The module instantiation is correctly passed the 3 packed inputs and uses them inside the module to assign the unpacked inputs din.a, din.b, din.c.
- The module outputs are correctly assigned to a single unpacked struct.
### Actual Behavior:
- All the inputs get dumped to a file named inputs.v
- The module instantiation is correctly passed the 3 packed inputs and uses them inside the module to assign the unpacked inputs din.a, din.b, din.c.
- The module outputs are correctly assigned to a single unpacked struct.

### Steps to Reproduce:
Please refer to the testbench code above.

### Other Relevant Information:
I have to use a struct to use the multiple inputs in the module instantiation. It is expected and right in the context of the testbench. The issue is that the unpacked structs assigned to the module inputs are not passed to the module and are not in the scope of the module to perform the appropriate unpacking.

---

I have run into some odd behavior with the Verilator tool. I am looking for some guidance on this one. I have some code that allows me to instantiate an instance of a module with multiple fields assigned to a single instance of a struct. This works as expected when I run the code with Verilog input files and the output is as expected. I am also able to compile the code with the code generation set to always inline and I get the expected output. However, when I try to compile the code with the code generation set as always static, I get the following error message.

Code Generation Error: Static code generation may not be performed on this module because it contains unverifiable code.

Any ideas on what is going on here or how I can get around this?

Thanks!username_1: You could simply create a module wrapper, which instantiates your module:

```
module test(
    output logic a,
    output logic b,
    output logic c
);

module wrapper(
    input logic [1:0] a,
    input logic [1:0] b,
    input logic [1:0] c,
    output logic [1:0] sa,
    output logic [1:0] sb,
    output logic [1:0] sc
);

// instantiate test module here

endmodule

```
Upvotes: 1 username_2: > 
> How can I use multiple fields of a struct in a Verilog module instantiation without creating multiple modules?
> 
> 
> 

Use a [package](https://design-examples.readthedocs.io/en/latest/design_examples/design_examples/verilog_code_examples/basic_examples/basic_packages/basic_packages.html) for this.  

This is a good way to group modules together that perform similar functions.

> 
> How can I pass multiple fields of a struct to a Verilog module?
> 
> 
> 

You put them together in a struct.  

You can pass a struct to a module.

> 
> When I try to instantiate the struct, the fields cannot be accessed inside the struct!
> 
> 
> 

This is not true of structs in Verilog.
You can access them inside the struct with `din.a`, `din.b`, etc.

> 
> Why does this happen?
> 
> 
> 

Your module is a functional unit, and the inputs are the same data type as the outputs.  

This is not the case with a struct.  

The inputs and outputs of a module are not the same data type.  

An error is thrown when this happens.

It is possible to assign a struct to a struct.

```
struct io {
    logic a, b, c;
    logic [3:0] string;
};

struct io din, dout;

din.a = bit_or_fr_rl(0,0,0);
din.b = bit_or_fr_rl(0,1,1);
din.c = bit_or_fr_rl(1,0,1);

dout.a = din.a;
dout.b = din.b;
dout.c = din.c;
dout.string = din.string;

```

You can not assign a struct to a logic, as the data types are not equal.
Upvotes: 3 [selected_answer]