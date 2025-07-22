module contres(o,i1,i2,i3,i4);
input i1,i2;
input i3,i4;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
initial begin
if (i1==1 && i2==1 && i3==1 && i4==1) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=1;
end else begin
if (i1==1 && i2==1 && i3==1 && i4==0) begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=1;
end else begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end
end
endmodule

## Example 23

module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
initial begin
if (i1==0 && i2==0) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==0 && i2==1) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==1 && i2==0) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==1 && i2==1) begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=1;
end else begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=X;
end
end
end
end
endmodule

## Example 24

module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
initial begin
if (i1==0 && i2==0) begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==0 && i2==1) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==1 && i2==0) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==1 && i2==1) begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=1;
end else begin
// 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=X;
end
end
end
end
endmodule

## Example 25

module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Resolution: 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
initial begin
if (i1==0 && i2==0) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==0 && i2==1) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin
if (i1==1 && i2==0) begin
// 1,1->1; 1,0->0; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
o=0;
end else begin