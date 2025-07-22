module test_delay(clock, reset, input1, input2, output1, output2);
input clock,reset;
input input1,input2;
output output1,output2;
// Delay the outputs by one clock cycle
// The generator is clocked by clock, reset by reset
buf(reset,weak0) g1(output1,input1);
buf(reset,weak0) g2(output2,input2);
buf(reset,weak0) g3(output1,output1);
count(clock) g4(output1,output2);