module mos_strength (a, c, zn, zp);
input a, c;
output zn, zp;
logic [1:0] St;
St = {(!c | a) & c, (!c |!a)};
zn = |St[0] ^ St[1]; // St0 or St1 is the output and xor with St0 or St1
zp = St[1]; // St1 is the output
endmodule
### Result:
### Run 1:
Testbench:
module top_level;
mos_strength u_mos (
.a(1),
.c(0)
);
mos_strength u_mos1 (
.a(1),
.c(0)
);
mos_strength u_mos2 (
.a(1),
.c(0)
);
mos_strength u_mos3 (
.a(1),
.c(0)
);
mos_strength u_mos4 (
.a(1),
.c(0)
);
mos_strength u_mos5 (
.a(1),
.c(0)
);
mos_strength u_mos6 (
.a(1),
.c(0)
);
mos_strength u_mos7 (
.a(1),
.c(0)
);
mos_strength u_mos8 (
.a(1),
.c(0)
);
mos_strength u_mos9 (
.a(1),
.c(0)
);
initial begin
#40 $display("Result 1: a=1, c=0"); #40$display("St0: %b", 1);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1); #40 $display("St0: %b", 1); #40$display("St1: %b", 0); #40 $display("Z: %b", 0); #40$display("St0: %b", 1);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1);
#40 $display("St0: %b", 1); #40$display("St1: %b", 1);
#40 $display("Z: %b", 0); end #40$display("Result 2: a=1, c=1");
#40 $display("St0: %b", 1); #40$display("St1: %b", 1); #40 $display("Z: %b", 0); #40$display("St0: %b", 0);
#40 $display("St1: %b", 1); #40$display("Z: %b", 0);
#40 $display("St0: %b", 1); #40$display("St1: %b", 1);
#40 $display("Z: %b", 0); end #40$display("Result 3: a=0, c=0");
#40 $display("St0: %b", 0); #40$display("St1: %b", 0); #40 $display("Z: %b", 0); #40$display("St0: %b", 0);
#40 $display("St1: %b", 0); #40$display("Z: %b", 0);
#40 $display("St0: %b", 0); #40$display("St1: %b", 0);
#40 $display("Z: %b", 0); end #40$display("Result 4: a=0, c=1");
#40 $display("St0: %b", 0); #40$display("St1: %b", 1); #40 $display("Z: %b", 0); #40$display("St0: %b", 0);
#40 $display("St1: %b", 1); #40$display("Z: %b", 0);
#40 $display("St0: %b", 0); #40$display("St1: %b", 1);
#40 $display("Z: %b", 1); end #40$display("Result 5: a=1, c=0 and vice versa");
#40 $display("St0: %b", 1); #40$display("St1: %b", 0); #40 $display("Z: %b", 1); #40$display("St0: %b", 0);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1);
#40 $display("St0: %b", 1); #40$display("St1: %b", 1);
#40 $display("Z: %b", 1); end #40$display("Result 6: a=1, c=1 and vice versa");
#40 $display("St0: %b", 0); #40$display("St1: %b", 0); #40 $display("Z: %b", 1); #40$display("St0: %b", 1);
#40 $display("St1: %b", 1); #40$display("Z: %b", 1);
#40 $display("St0: %b", 0); #40$display("St1: %b", 1);
#40 $display("Z: %b", 1); end #40$display("Result 7: a=0, c=0 and vice versa");
#40 $display("St0: %b", 0); #40$display("St1: %b", 0); #40 $display("Z: %b", 1); #40$display("St0: %b", 0);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1);
#40 $display("St0: %b", 1); #40$display("St1: %b", 1);
#40 $display("Z: %b", 1); end #40$display("Result 8: a=0, c=1 and vice versa");
#40 $display("St0: %b", 0); #40$display("St1: %b", 1); #40 $display("Z: %b", 1); #40$display("St0: %b", 1);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1);
#40 $display("St0: %b", 0); #40$display("St1: %b", 0);
#40 $display("Z: %b", 1); end #40$display("Result 9: a=1, c=0 and a=0, c=0");
#40 $display("St0: %b", 1); #40$display("St1: %b", 0); #40 $display("Z: %b", 0); #40$display("St0: %b", 1);
#40 $display("St1: %b", 0); #40$display("Z: %b", 1);
#40 $display("St0: %b", 1); #40$display("St1: %b", 0);
#40 $display("Z: %b", 1); end #40$display("Result 10: a=1, c=0 and a=0, c=1");
#40 $display("St0: %b", 1); #40$display("St1: %b", 1); #40 $display("Z: %b", 0); #40$display("St0: %b", 0);
#40 $display("St1: %b", 1); #40$display("Z: %b", 1);
#40 $display("St0: %b", 1); #40$display("St1: %b", 0);
#40 $display("Z: %b", 1); end #40$display("Result 11: a=1, c=1 and a=1, c=0");
#40 $display("St0: %b", 0); #40$display("St1: %b", 1); #40 $display("Z: %