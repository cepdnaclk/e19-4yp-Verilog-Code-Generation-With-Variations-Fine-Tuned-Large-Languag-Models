module contres(o,i1,i2);
input i1,i2;
output o;
reg o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
initial begin
$display("Continuous Resistor Test: ");
$display("1,1=%b, 1,0=%b, 0,1=%b, 0,0=%b",i1,i1,i2,i2);
$display("1,Z=%b, 0,Z=%b",'1, i2);
end
endmodule

### References
- https://www.edaplayground.com/x/46ZG
- https://www.wokwi.com/projects/309163760496296977
### SystemVerilog Code
```
module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
initial begin