module contres(o,i1,i2);
initial begin
i1 = 1'b0;
i2 = 1'b0;
end
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Variation Verilog Code:
module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Variation Instruction:
This is the same as the previous variation. Except that the test is over the whole array
### Variation Verilog Code:
module contres(o,i1,i2);
input i1,i2;
output o;
initial begin
i1 = 1'b0;
i2 = 1'b0;
end
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Variation Instruction:
Add an initial block: test the whole array of "i1" and "i2" separately
### Variation Verilog Code:
module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule
### Variation Instruction:
Do the same thing, but with a for-loop that test the array element by element (instead of the whole array at once)
### Variation Verilog Code:
module contres(o,i1,i2);
input i1,i2;
output o;
for (i=0; i<2; i=i+1) begin
if ((i1[i] == 1'b1) && (i2[i] == 1'b1)) begin
o = 1'b1;
end
else begin
o = 1'b0;
end
end
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance