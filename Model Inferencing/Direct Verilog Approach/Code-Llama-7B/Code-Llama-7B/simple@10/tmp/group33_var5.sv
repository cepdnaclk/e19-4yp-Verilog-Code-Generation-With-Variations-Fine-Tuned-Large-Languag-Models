module ha_1(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,-($delay_1.delay_1)) (s,a,b);
  and #(3,-($delay_3.delay_3)) (ca,a,b);
  timeunit 1ns;
  timeprecision 1ps;
  parameter struct {time delay_1; time delay_3;} delays = '{delay_1:0ps, delay_3:0ps};
  time $delay_1 = delays.delay_1;
  time $delay_3 = delays.delay_3;
endmodule
module ha_2(s,ca,a,b); // Half Adder with gate delays
  input a,b; output s,ca;
  xor #(1,-($delay_2.delay_2)) (s,a,b);
  and #(3,-($delay_4.delay_4)) (ca,a,b);
  timeunit 1ns;
  timeprecision 1ps;
  parameter struct {time delay_2; time delay_4;} delays = '{delay_2:0ps, delay_4:0ps};
  time $delay_2 = delays.delay_2;
  time $delay_4 = delays.delay_4;