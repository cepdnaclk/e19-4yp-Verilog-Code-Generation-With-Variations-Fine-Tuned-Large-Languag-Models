module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
initial begin
 // Test for a pull-1 input of '1' over the whole range
 repeat(10)
 #10 i1 = 1'b1;
 // Test for a weak-0 input of '0' over the whole range
 repeat(10)
 #10 i2 = 1'b0;
end
endmodule