module testbench ();
struct { struct { rand int i; } rand_data; } data;
generate data;
process data;
endmodule
### Injected Procedures:
def rand::int;
enddef
### Expected Output:
### Base Verilog Code:
module testbench ();
generate data;
process data;
endmodule
### Variation Instruction:
Replace the data construct with a struct containing