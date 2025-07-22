```verilog
module mos_strength (a, c, zn, zp);
input a;
input [1:0] c; // Define enum type 
output zn, zp;

enum {St0, St1} ZeroState; // Define enum value St0 and St1

nmos (zn, a, c == ZeroState.St0? 1 : 0); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c == ZeroState.St1? 1 : 0); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
endmodule
```
In this modified code, we've replaced the xor and and gate expressions with a logic-vector based enum to test enum operations. The `ZeroState` enum includes `St0` (representing '0' state) and `St1` (representing '1' state). We then use a ternary operator to check if `c` equals `St0` or `St1` and set the output accordingly. The `nmos` module and `pmos` modules are also updated accordingly. This modification allows the design to control the operation of `nmos` and `pmos` based on the conditions established by the enum values. Note that the use of enum type might make the design more readable and understandable. However, it's crucial to consider the actual implementation details of the underlying hardware, such as the ability to represent the enum values using logic vectors. The above code is an example and may vary depending on the synthesis tool being used and the specific hardware it supports. Also, the `nmos` and `pmos` modules are assumed to be present in the hardware description language (HDL) being used.

This is just a logical change from an enumerated type and doesn't affect the underlying hardware or simulation. The outputs will be the same as before based on the logic provided in the `nmos` and `pmos` modules. The synthesis tool will convert the enum operations to the equivalent logic vectors for the actual hardware implementation. If the synthesis tool doesn't support the enum type, then the code will be converted to logic vectors directly during the synthesis process. 

Finally, it's important