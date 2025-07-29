module ha_1(s,ca,a,b);
  input a,b; output s,ca;
  xor #(1,2) (s,a,b);
  and #(3,4) (ca,a,b);
endmodule
module top(in1,in2,s,ca);
  input [7:0] in1,in2; output s,ca;
  ha_1 u1(s,ca,in1[0],in2[0]);
  ha_1 u2(s,ca,in1[1],in2[1]);
  ha_1 u3(s,ca,in1[2],in2[2]);
  ha_1 u4(s,ca,in1[3],in2[3]);
  ha_1 u5(s,ca,in1[4],in2[4]);
  ha_1 u6(s,ca,in1[5],in2[5]);
  ha_1 u7(s,ca,in1[6],in2[6]);
  ha_1 u8(s,ca,in1[7],in2[7]);
endmodule

module delay_1 (y,delay,x);
  input [15:0] delay,x; output y;
  wire [15:0] z;
  ha_1 u1(z[0],z[1],x,1'b1);
  ha_1 u2(z[1],z[2],z[0],1'b0);
  ha_1 u3(z[2],z[3],z[1],1'b0);
  ha_1 u4(z[3],z[4],z[2],1'b0);
  ha_1 u5(z[4],z[5],z[3],1'b0);
  ha_1 u6(z[5],z[6],z[4],1'b0);
  ha_1 u7(z[6],z[7],z[5],1'b0);
  ha_1 u8(z[7],z[8],z[6],1'b0);
  ha