module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    int i;
    while (i<15) begin
        ObusReg <= Storage[i];
        i = i + 1;
    end
end
endmodule
### Violation Messages:
RAM.sv:10: Verilog-2001 allows loop bounds to be constants.
RAM.sv:12: Verilog-2001 allows loop bounds to be constants.

### Cause:
The C++ source for SystemVerilog-2005 is being able to infer and optimize out array slices more than C++ 11 is.

### Recommendation:
Use C++ 11 for this work.