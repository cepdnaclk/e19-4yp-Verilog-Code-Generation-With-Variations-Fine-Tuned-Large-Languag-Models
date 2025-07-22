module orfr_tst;
   typedef struct packed {
     logic a;
     string s;
   } data_t;
   data_t b,c;
   initial begin
     b = '{1'b0, "Input b"};
     c = '{1'b0, "Input c"};
     #20 $stop;
   end
   always #3 c = ~c;
   or_fr_rl #(.DATA_T(data_t)) dd(a,b,c);
endmodule
### Tested with Icarus Verilog 10.0.
### Differences from Verilog 2005:
The packed unpacked attribute is not defined in Verilog 2005.