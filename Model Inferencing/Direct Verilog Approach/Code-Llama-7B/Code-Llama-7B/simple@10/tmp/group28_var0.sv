module example4(In1, In2, Out1, Out2);
input [3:0] In1;
input [3:0] In2;
output [7:0] Out1;
output [7:0] Out2;
wire [3:0] Out1_2;
wire [3:0] Out2_2;
wire [7:0] Out1;
wire [7:0] Out2;
assign Out1[0] = Out1_2[0];
assign Out1[1] = Out1_2[1];
assign Out1[2] = Out1_2[2];
assign Out1[3] = Out1_2[