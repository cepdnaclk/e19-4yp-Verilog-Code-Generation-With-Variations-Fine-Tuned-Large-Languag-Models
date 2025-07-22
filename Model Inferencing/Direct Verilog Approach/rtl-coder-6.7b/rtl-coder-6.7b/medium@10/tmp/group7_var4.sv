module contres(o,i1,i2);
input i1,i2;
output o;
wire [1:0] t;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
initial begin
t = {i1,i2};
$display("t = %b", t);
$display("Continuous res: t=%0b: %b",t,o);
assert ($isunknown(t)) $display("t is undefined");
end
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominates over weak0
endmodule