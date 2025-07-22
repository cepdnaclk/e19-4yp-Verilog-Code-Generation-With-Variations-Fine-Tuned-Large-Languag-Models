module ha_2(s,ca,a,b,del); 
  input a,b; output s,ca;
  localparam ha_del ha_delay=new(3,4,1,2);
  xor #(ha_delay.xor_delay) (s,a,b);
  and #(ha_delay.and_delay) (ca,a,b);
endmodule
module ha_delay(signed xor_delay,signed and_delay);
endmodule
localparam ha_del ha_delay=new(3,4,1,2);