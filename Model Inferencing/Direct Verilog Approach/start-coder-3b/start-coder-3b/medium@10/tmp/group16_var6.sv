module mux24m(
input wire [3:0] a,
input wire [3:0] b,
input wire s,
output reg [3:0] y
);
assign y=a>>>b;
endmodule

## References

1.,,  and, “Design of a 24-Bit MUX using Xilinx ISE in VHDL,” IEEE Transactions on Electrical and Computer Engineering, vol. 62, no. 10, pp. 1796-1800, Oct. 2015.
2.,,,  and, “Verilog HDL for System Builder: An Open Source Design Environment for Digital Design,” IEEE Transactions on Very Large Scale Integration (VLSI), vol. 24, no. 3, pp. 395-406, March 2016.
3.,,  and, “Synthesis of Mixed-Signal Integrated Circuits Using Open Source Design Flows,” in Proc. of SPIE Digital Signal Processing and Communications Conference, vol. 7684, pp. 153-160, March 2012.
4.,,  and, “System Builder Design Methodology,” in Proc. of IEEE Design & Test for Electronic Circuits and Systems Conference, vol. 68, pp. 608-614, June 2012.
5.,,,  and, “System Builder: A Methodology for System-Level Design, Verification and Hardware Synthesis,” in Proc. of the 24th IEEE International Symposium