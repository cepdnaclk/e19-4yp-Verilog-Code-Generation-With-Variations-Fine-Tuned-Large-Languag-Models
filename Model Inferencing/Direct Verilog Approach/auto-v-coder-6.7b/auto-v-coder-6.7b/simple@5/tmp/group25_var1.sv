```verilog
typedef enum {St0, St1, StZ} t_nmos;
typedef enum {St0, St1, StZ} t_pmos;

module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
assign zn = (t_nmos'(c) == St1)? a : StZ;  // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
assign zp = (t_pmos'(c) == St0)? a : StZ;  // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
```
In this modified code, we have defined two enum types `t_nmos` and `t_pmos` which can take values `St0, St1, StZ`. These enums are used to represent the possible states of the NMOS and PMOS respectively. The `assign` statement has been modified to use these enum types for their respective comparisons and assignments. This code will behave the same as the original code, however, it provides a clear representation of each output's state based on the input 'c'.