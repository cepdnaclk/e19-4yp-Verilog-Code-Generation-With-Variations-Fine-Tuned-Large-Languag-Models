module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
initial
// Test an inside expression
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
endinitial
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior is OR due to pull1 dominance over weak0
endmodule

## SDC File

//=========================================================
// Test file for "Test inside Array Expression"
//=========================================================

module top;
input wire clock;
// Drive wire 'o' from two buffers with specified output strengths
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
endmodule

## SDC Script

## Generated Verilog Code:

//=============================================================
// Test file for "Test inside Array Expression"
//=============================================================

// Generated using the Vivado Design Suite: 2019.1.0.515
//=============================================================
// module top(clock);
// input wire clock;
// buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
// buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
// buf(pull1, weak0) g3(o,i3); // Drives pull '1', weak '0'
// buf(pull1, weak0) g4(o,i4); // Drives pull '1', weak '0'
// buf(pull1, weak0) g5(o,i5); // Drives pull '1', weak '0'
// buf(pull1, weak0) g6(o,i6); // Drives pull '1', weak '0'
// buf(pull1, weak0) g7(o,i7); // Drives pull '1', weak '0'
// buf(pull1, weak0) g8(o,i8); // Drives pull '1', weak '0'
// buf(pull1, weak0) g9(o,i9); // Drives pull '1', weak '0'
// buf(pull1, weak0) g10(o,i10); // Drives pull '1', weak '0'
// buf(pull1, weak0) g11(o,i11); // Drives pull '1', weak '0'
// buf(pull1, weak0) g12(o,i12); // Drives pull '1', weak '0'
// buf(pull1, weak0) g13(o,i13); // Drives pull '1', weak '0'
// buf(pull1, weak0) g14(o,i14); // Drives pull '1', weak '0'
// buf(pull1, weak0) g15(o,i15); // Drives pull '1', weak '0