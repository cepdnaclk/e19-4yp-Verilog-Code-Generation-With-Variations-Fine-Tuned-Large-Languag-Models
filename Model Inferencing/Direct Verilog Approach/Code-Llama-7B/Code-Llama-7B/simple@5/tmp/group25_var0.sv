module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
nmos (zn, a, c); // NMOS passes 'a' when 'c' is 1 (outputs St0 or Z)
pmos (zp, a, c); // PMOS passes 'a' when 'c' is 0 (outputs St1 or Z)
`ifdef VARIANT_01 // this code is for non-enum, non-vector operations
assign zn = (c)? a : (~a);
assign zp = (c)? (~a) : a;
`elsif VARIANT_02 // this code is for enum based operations
typedef enum logic {St0=1’b0, St1=1’b1} st_enum_t;
st_enum_t z_n, z_p;
assign z_n = c? St0 : St1;
assign z_p = c? St1 : St0;
`else // this code is for vector based operations
logic [1:0] z_n, z_p;
assign z_n = (c)? a : (~a);
assign z_p = (c)? (~a) : a;
`endif
endmodule
### Design Specification:
The design shall support the following operations:
* replace logic functions with enum operations
* replace logic functions with vector operations
* replace logic functions with non-enum, non-vector operations
### Test Plan:
* Test cases that are expected to pass when using non-enum, non-vector operations:
    * Passing test cases:
      * [TEST] TB_MOS_STRENGTH.v
    * Failing test cases: 
      * [FAIL] TB_MOS_STRENGTH.v
      * [FAIL] TB_MOS_STRENGTH_VEC.v
      * [FAIL] TB_MOS_STRENGTH_ENUM.v
* Test cases that are expected to pass when using vector operations:
    * Passing test cases:
      * [TEST] TB_MOS_STRENGTH.v