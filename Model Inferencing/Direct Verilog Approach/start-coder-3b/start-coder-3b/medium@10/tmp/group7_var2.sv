module contres(o,i1,i2);
input i1,i2;
output o;
// Drive wire 'o' from two buffers with specified output strengths
buf b1 (pull1, weak0) g1 (.o(i1[0:3]),.i1(i1[0:3])); // Drives pull '1', weak '0'
buf b