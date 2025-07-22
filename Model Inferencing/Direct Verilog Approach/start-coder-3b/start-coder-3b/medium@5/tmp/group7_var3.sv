module contres(o,i1,i2);
input i1,i2;
output o;
wire [0:1] i1i2[3];
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
wire [3:0] i1i2i1i2;
i1i2i1i2[0] = (i1i2[0] == 1 && i1i2[1] == 0) || (i1i2[0] == 0 && i1i2[1] == 1);
i1i2i1i2[1] = (i1i2[0] == 1 && i1i2[2] == 0) || (i1i2[0] == 0 && i1i2[2] == 1);
i1i2i1i2[2] = (i1i2[1] == 1 && i1i2[2] == 0) || (i1i2[1] == 0 && i1i2[2] == 1);
i1i2i1i2[3] = (i1i2[1] == 1 && i1i2[2] == 0) || (i1i2[1] == 0 && i1i2[2] == 1);
// Resolution: 1,1->1; 1,0->1; 0,1->1; 0,