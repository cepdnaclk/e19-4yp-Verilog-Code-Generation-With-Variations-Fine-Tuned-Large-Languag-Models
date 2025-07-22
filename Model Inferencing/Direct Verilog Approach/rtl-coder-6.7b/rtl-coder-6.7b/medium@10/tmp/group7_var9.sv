module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
initial begin
$display("Testing contres's behavior:");
$display("i1   i2   o");
for (i=0; i<4'b1000; i++) $display("%b %b  %b", i[3], i[2], o); // This line should print: 
// i1   i2   o
// 0    0     0
// 0    1     1
// 1    0     1
// 1    1     1
end
endmodule