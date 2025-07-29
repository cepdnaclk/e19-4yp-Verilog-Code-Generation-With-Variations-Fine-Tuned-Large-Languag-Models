module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
 // An initial block tests the array as a whole range.
 initial begin
    o==(i1||i2);
 end
endmodule
### Variation Description:
An initial block that tests an inside expression over an array as a whole range.
### Passing Condition:
Same as above.
### Failing Condition:
An initial block that tests the inside expression over an array as a whole range without using `if` and `end` statements.
### Coverage:
None.
### Failing Path:
`i1=0, i2=0`
### Score:
10/10
### Comments:
None.
### References:
### Links: 
### Results:
### To Do:
Comparison of this module with other 2-input gates.
### Changelog:
1.1: Initial version
### Version:
1.1
### Created:
19 NOV 2017
### Author:
[Xiaofan He](https://github.com/xiaofan24)
### Reviewed by:
[Prof. David Z. Pan](https://github.com/