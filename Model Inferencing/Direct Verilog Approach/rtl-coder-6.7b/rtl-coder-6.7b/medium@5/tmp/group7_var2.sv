module contres_pulldown(o,i);
input i;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, pulldown) g1(o,i); // Drives pull '1', pulldown

// Resolution: 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pulldown dominance over pull1
initial
begin
// Test for array values of i
assign o = i[1] || i[2];
end
endmodule
### Original Description:
This variation tests an inside