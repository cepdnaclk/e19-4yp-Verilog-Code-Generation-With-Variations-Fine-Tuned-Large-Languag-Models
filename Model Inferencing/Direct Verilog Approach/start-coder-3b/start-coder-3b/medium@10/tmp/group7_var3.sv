module foo(o1,o2);
output o1,o2;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o1,1'b1);
buf(pull1, weak0) g2(o2,1'b0);
endmodule
module bar(i1,i2,o1,o2);
input i1,i2;
output o1,o2;
// Drive wire 'o' from two buffers with specified output strengths
buf(pull1, weak0) g1(o1,i1);
buf(pull1, weak0) g2(o2,i2);
endmodule