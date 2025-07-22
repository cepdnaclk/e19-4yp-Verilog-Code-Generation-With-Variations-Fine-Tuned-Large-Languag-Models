module tstha_9(input clk, input logic [2:0] ab, output logic s, ca);
  logic [1:0] a,b;
  assign {a,b} = ab;
  ha_9 hh(s,ca,a,b);
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
endmodule