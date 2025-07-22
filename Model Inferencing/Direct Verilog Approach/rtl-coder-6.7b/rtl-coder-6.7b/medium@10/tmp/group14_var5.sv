module mux21b (
input wire a,
input wire b,
input wire s,
output reg y // Output must be reg for procedural assignment
);
always @(*) // Combinational sensitivity
casez ({a, b, s})
3'b1?? : y = 1'b1;
3'b01? : y = 1'b0;
default: y = 1'bz;
endcase
endmodule
### Comparing the two modules together using the following Icarus Verilog code:
iverilog -Wall mux21b.v mux21b_p.v
vvp a.out
vvp -n a.out