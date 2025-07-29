module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(out, din1, din2);
  input din1, din2; wire out;
  string s="or_fr,rl";
  // The following structure contains both a logic vector and a string
  struct { logic [3:0] out; string name; } out_str;
  // The following typedef defines the type of the unpacked
  // structure containing the data and name fields
  typedef struct { logic [3:0] out; string name; } output_str_t;
  assign out_str.out = din1 | din2;
  assign out_str.name = s;
  assign out = out_str.out;
```
### Reference:
* [Verilog HDL Simulation - Part 2](https://www.vlsm