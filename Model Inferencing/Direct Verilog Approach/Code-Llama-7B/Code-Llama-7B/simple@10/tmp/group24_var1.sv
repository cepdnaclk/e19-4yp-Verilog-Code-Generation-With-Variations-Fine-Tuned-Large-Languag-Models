module DFF (input logic clk, input logic D, output logic Q);
DFF_PQT #(logic[7:0] packed_union) dut (
   .clk(clk),
   .D(D),
   .Q(Q)
);
endmodule
#### Package Definition:
package DFF_PQT;
parameter logic [7:0] packed_union;
endpackage
### Variation Inst