module ha_1(s,ca,a,b);
   input a,b; output s,ca;
   xor #(1,2) (s,a,b);
   and #(3,4) (ca,a,b,delay=1.2);@@ -67,13