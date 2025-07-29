module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  initial
    in =1'b1; // Start with input high -> output low
  always
  //initial $monitor($time, " in = %b, output = %b ",in,out);
  initial $monitor($time, " input = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Variation Verification Steps:
- Compile and simulate the code
### Expected Results:
- No error message
### Actual Results:
- Error:
```
Error (suppressible): (vlog-13069) Illegal reference to an undefined net, block, or generate block: 'nmv'. The reference is at line 4 : in tst_nm_in.v, column 14.
The object was declared in tst_nm_in.v(0).
```
### Variation Verification Steps:
- Change the function call to a function instantiation
### Expected Results:
- No error message