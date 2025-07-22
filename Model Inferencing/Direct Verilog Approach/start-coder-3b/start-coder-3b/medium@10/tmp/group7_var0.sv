module equivtest(o1,o2,i1,i2,i3);
input i1,i2,i3;
input [7:0] sel;
output o1,o2;
// Evaluate if two wires are the same
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,0->0; 1,Z->1; 0,Z->X; Z,Z->Z
// Effective behavior