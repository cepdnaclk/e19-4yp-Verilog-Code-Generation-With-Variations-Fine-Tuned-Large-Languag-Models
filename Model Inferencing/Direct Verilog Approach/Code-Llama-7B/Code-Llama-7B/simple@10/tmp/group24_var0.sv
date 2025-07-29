```
module DFF (clk, input d, output q);
//...
endmodule
`endif

`ifndef DFF_WITH_UNION
//...
import "DPI-C" function void dff_with_union(logic [7:0] a, logic [7:0] b, logic [7:0] c, logic [7:0] d, logic [7:0] e, logic [7:0] f, logic [7:0] g, logic [7:0] h, logic [7:0] i, logic [7:0] j, logic [7:0] k);
`define DFF_WITH_UNION
module DFF (clk, input d, output q);
//...
endmodule
`endif

module DFF_WITH_UNION (
     input clk,
     input d,
     output q
);
   timeunit 1ns;
   timeprecision 1ps;
`ifdef USE_PLI
   parameter STEP = 10ns;
`endif
   reg q_out;
   wire d_out, clk_out;
   reg [7:0] a, b, c, d, e, f, g, h, i, j, k;

`ifdef USE_PLI
   initial begin
      a = 8'h11;
      b = 8'h22;
      c = 8'h33;
      d = 8'h44;
      e = 8'h55;
      f = 8'h66;
      g = 8'h77;
      h = 8'h88;
      i = 8'h99;
      j = 8'hAA;
      k = 8'hBB;
      dff_with_union(a,b,c,d,e,f,g,h,i,j,k);
   end
`endif

   always begin
      #STEP
      $display("-- A = %0h", a);
      $display("-- B = %0h", b);
      $display("-- C