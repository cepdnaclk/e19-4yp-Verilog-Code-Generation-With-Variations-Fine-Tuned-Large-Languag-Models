module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop;
endmodule

module ha_9(s,ca,q1,q2);
     input q1,q2,ca;
     output s;

     wire t1,t2,t3,t4,t5,t6,t7;
     assign s = ca;

     full_adder_9 f1(t1,t2,t3,t4,t5,t6,t7,q2,q1,ca);
     full_adder_9 f2(t4,t5,t6,t7,s,t3,t2,t1,ca,q1);
endmodule

module full_adder_9(s,c,a,b,cin);
     input a,b,cin;
     output s,c;

     wire t1,t2,t3,t4;

     ha_8 fa1(c1,t2,a,b,cin);
     ha_8 fa2(s,c2,a,b,c1);