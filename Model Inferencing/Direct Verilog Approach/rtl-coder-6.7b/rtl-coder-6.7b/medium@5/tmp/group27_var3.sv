```
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule
```
### Analysis:
- The Verilog code above cannot be synthesized well because the `XMR` is not supported in current version. The synthesis engine will throw an error out like below.
```
[Error] Error 123: Cannot convert hierarchical index to an unsigned type.
```/src/tests/unit_tests/unit_test_15_23.c
#include "unit-test.h"

bool test_15_23() {

    bool result = true;

    //
    // Test Case:
    //
    // module test();
    //   integer i;
    //   for (i=0; i<32; i=i+2)
    //     assign o = a? i : i-1;
    // end
    //
    // with the constraint that o is not driven.
    //
    // This is to test a bug in the xmr_assign_to_array_index()
    // function.  Basically, without the constraint, the
    // for-loop is transformed into the following for-loop
    // (where n is the upper bound on the for-loop):
    //
    // for (i=0; i<n; i=i)
    //   for (j=0; j<n; j=j+1)
    //     assign o[i][j] = a? i : i-1;
    // end
    //
    // The for-loop transformation is incorrect because the
    // outermost for-loop is unconstrained.  The outer loop
    // should be transformed into the following:
    //
    // for (i=0; i<n; i=i)
    //   for (j=0; j<n; j=j)
    //     assign o[i][j] = a? i : i-1;
    // end
    //
    // The result will be incorrect because a constraint
    // must be applied to the innermost for-loop.  An
    // alternative for this test case is to use this
    // code to test xmr_assign_to_array_index():
    //
    // module test();
    //   integer i;
    //   for (i=0; i<32; i=i+2)