```
// Module declaration
module tstdlatch;
   reg d,en;
   wire q,qb;
   // dlatch ff(en,d,q,qb);
   initial
      begin
         d = 1'b0;
         en = 1'b0; // Latch disabled
      end
   always #4 en =~en; // Enable toggles every 4 time units
   always #8 d =~d; // Data toggles every 8 time units
   initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
   initial #40 $stop;
endmodule
```
### References:
[1] https://www.synopsys.com/support/resources/synthesis/tutorials/synopsys_tut_latch_removal.html
[2] https://www.edn.com/design/testing/4321696/An-overview-of-the-different-types-of-latch-on-synthesis
[3] https://en.wikipedia.org/wiki/Latch_(electronics)