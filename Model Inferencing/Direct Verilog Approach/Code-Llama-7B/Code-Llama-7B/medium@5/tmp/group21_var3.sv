module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  default function integer f(input integer a, input integer b, input integer c, input integer d);
    f = 0;
  endfunction
  default case(in)
    0: function f = {a,b,c,d}; // (0,0,0,0)
    1: function f = {a,b,c,d}; // (0,0,0,1)
    2: function f = {a,b,c,d}; // (0,0,1,0)
    3: function f = {a,b,c,d}; // (0,0,1,1)
    4: function f = {a,b,c,d}; // (0,1,0,0)
    5: function f = {a,b,c,d}; // (0,1,0,1)
    6: function f = {a,b,c,d}; // (0,1,1,0)
    7: function f = {a,b,c,d}; // (0,1,1,1)
    8: function f = {a,b,c,d}; // (1,0,0,0)
    9: function f = {a,b,c,d}; // (1,0,0,1)
    default: f = 0;
  endcase
  initial
    in =1'b1; // Start with input high -> output low
  always
    out = f(a,b,c,d);
  always
  initial $monitor($time, " in = %b, output = %b ",in,out);
  initial #15 $stop; // Stop simulation
endmodule
### Suggested Solution:
module tst_nm_in();
  reg in; wire out;
  NMOSinv nmv(out,in); // Instantiate NMOS inverter
  parameter a = 2;
  parameter b = 1;
  parameter c = 2;
  parameter d = 1;
  default function integer f(input integer a, input integer b, input integer c, input integer d);
    f = 0;
  endfunction
  default case(in)
    0: function f = {a,b,c,d}; // (0,0,0,0)
    1: function f = {a,b,c,d}; // (0,0,0,1)
    2: function f = {a,b,c,d}; // (0,0,1,0)
    3: function f = {a,b,c,d}; // (0,0,1,1)
    4: function f = {a,b,c,d}; // (0,1,0,0)
    5: function f = {a,b,c,d}; // (0,1,0,1)
    6: function f = {a,b,c,d}; // (0,1,1,0)
    7: function f = {a,b,c,d}; // (0,1,1,1)
    8: function f = {a,b,c,d}; // (1,0,0,0)
    9: function f = {a,b,c,d}; // (1,0,0,1)
    default: f = 0;
  endcase