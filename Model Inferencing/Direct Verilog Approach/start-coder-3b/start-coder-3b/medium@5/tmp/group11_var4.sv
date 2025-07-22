module nand2(g,a,b);
output g;
input a,b;
assign g = (~a && b) || (~b && a);
endmodule
module nor2(g,a,b);
output g;
input a,b;
assign g = (~a && b) || (~b && a);
endmodule
module and2(g,a,b);
output g;
input a,b;
assign g = (~a || b) && (~b || a);
endmodule
module or2(g,a,b);
output g;
input a,b;
assign g = (~a && b) || (~b && a);
endmodule
### Results on 100 Time Steps:
Initial step:
a=1,b=1,g=1
Final step:
a=1,b=1,g=1
Initial step:
a=1,b=0,g=1
a=1,g=1,b=0
Final step:
a=1,b=0,g=1
a=1,g=1,b=0
Initial step:
a=0,b=1,g=1
a=1,b=0,g=1
a=0,g=1,b=1
Final step:
a=0,b=1,g=1
a=1,b=0,g=1
a=0,g=1,b=1
Initial step:
a=0,b=0,g=1
a=1,g=1,b=0
Final step:
a=0,b=0,g=1
a=1,g=1,b=0