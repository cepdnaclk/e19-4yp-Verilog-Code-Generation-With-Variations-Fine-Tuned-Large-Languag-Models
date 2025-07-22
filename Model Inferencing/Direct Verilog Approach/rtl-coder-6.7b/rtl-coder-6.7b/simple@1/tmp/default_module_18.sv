// NOT gate with delay 2
    module show_aa(ao,ai); 
      output ao; input ao,ai;
      not #2 (ao,ai);
    endmodule
Note that the code is not exactly the same, as the default value of an enum is `a1`.
So for the following tests:
`$show_aa a1 a2`
`$show_aa a2 a0`
`$show_aa a0 a0`
`$show_aa a1 a1`
The outputs are:
`a2 a2`
`a1 a1`
`a0 a0`
`a1 a1`


### Original Code:
    // NOT gate with delay 2
    module show_aa(ao,ai); // NOT gate with delay 2
      output ao; input ai; wire ao, ai;
      not #2 (ao,ai);
    endmodule