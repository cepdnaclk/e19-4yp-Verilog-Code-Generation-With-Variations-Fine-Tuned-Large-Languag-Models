```verilog
typedef struct {int signed s, int signed ca, int signed co;} delays_t;
module fa_1(s,ca,co,a,b,c); // Full Adder with gate delays
  input a,b,c; output s,ca,co;
  and #(9,10) (s,a,b);
  xor #(14,15) (s,a,c);
  xor #(11,12) (s,a,s);
  and #(17,18) (co,a,b);
  xor #(23,24) (co,a,c);
  x