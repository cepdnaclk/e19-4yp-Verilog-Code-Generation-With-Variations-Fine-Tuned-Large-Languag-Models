module show_ab(ao,ai); // NOT gate with delay 2
  typedef enum {F1 = 0, F2 = 1} flag_type; // packed enum with 2 symbols
  output ao; input ai;
  wire ao, ai; logic a, b;
  assign a = ai; // unpacked input to packed input
  assign b = ai; // packed input to packed input
  not #2 (ao,a); not #2 (b); // unpacked input to packed input
  not #1 (ao, ai); // packed input to packed input
  // not #3 (ao,ai); // not allowed
endmodule
### Simulation Logic:
// Not allowed:
// not #3 (ao,ai); // error: Illegal use of packed arrays (ao) as lvalue

// Ok:
// not #1 (ao, ai); // legal
// not #2 (ao,a); // legal (a is unpacked)
// not #2 (b); // legal (b is packed)
### Expected Result:
Ao should be 1 on every clock.
### Simulation Logic:
// not #1 (ao, ai); // legal
// not #2 (ao,a); // legal (a is unpacked)
// not #2 (b); // legal (b is packed)
// not #3 (ao,ai); // error: Illegal use of packed arrays (ao) as lvalue
### Expected Result:
Ao should not change on every clock.
### Actual Results:
Ao should stay 0.
### Pass/Fail Criteria:
Pass if Ao is not 1 on every clock; fail otherwise.

### Potential Problems:
None

### Notes:
None

### Design Goals:
None

### Design Considerations:
None

### Potential Future Changes:
None

### 2019-04-23 14:34:20 UTC:

### Base Verilog Code:
module show_ac(ao,ai,bj,bi);
  output ao; input ai,