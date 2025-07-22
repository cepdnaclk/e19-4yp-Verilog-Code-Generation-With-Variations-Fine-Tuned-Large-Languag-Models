module contres(o,i1,i2,i3);
input i1,i2,i3;
output o;
o=i1[1:2];
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o,i1); // Drives pull '1', weak '0'
buf(pull1, weak0) g2(o,i2); // Drives pull '1', weak '0'
buf(pull1, weak0) g3(o,i3