module AndOr (output X, Y, bit A, input B, C);
assign #10 X = A & B;
assign #10 Y = B | C;
endmodule
### Result
- [x] SystemVerilog code
- [ ] Verilog code
- [ ] VHDL code
- [ ] Verilog code with a bit input