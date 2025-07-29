module pulses2;
  reg [8:0] I;
  reg a,b;
  always @ (I) begin // Counter
    case (I[4:2]) // Use of a range that is 1 bit longer will always be 0
      0: I = I + 1; // Increment I
      1: I = I + 10; // Increment I
      2: I = I + 100; // Increment I
      3: I = I + 1000; // Increment I
    endcase
  end
  initial I=0; // Initialize I
  initial #100 $stop; // Stop simulation
endmodule
### Unit Test:
module pulses_tb2;
  pulse pulses2();
endmodule
### Scope:
I:
0: #100
1: #100
2: #100
3: #100
4: #100
5: #100
6: #100
7: #100
8: #100
9: #100
10: #100
11: #100
12: #100
13: #100
14: #100
15: #100
16: #100
17: #100
18: #100
19: #100
20: #100
21: #100
22: #100
23: #100
24: #100
25: #100
26: #100
27: #100
28: #100
29: #100
30: #100
31: #100
32: #100