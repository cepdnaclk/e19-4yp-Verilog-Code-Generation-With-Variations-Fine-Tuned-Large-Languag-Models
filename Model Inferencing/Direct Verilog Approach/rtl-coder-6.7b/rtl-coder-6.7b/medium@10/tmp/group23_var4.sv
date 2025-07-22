module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    integer i;
    while (i<15) begin
        ObusReg <= Storage[i];
        i <= i+1;
    end
end
endmodule
### Expected Output after synthesis:
WARNING:Xst:410 - Verilog HDL syntax error at RAM.v(15) near "begin": Syntax error found at or before )
WARNING:Xst:410 - Verilog HDL syntax error at RAM.v(16) near "integer": Syntax error found at or before i.
WARNING:Xst:410 - Verilog HDL syntax error at RAM.v(17) near "<=": Syntax error found at or before i.
WARNING:Xst:410 - Verilog HDL syntax error at RAM.v(18) near "+": Syntax error found at or before i.
WARNING:Xst:410 - Verilog HDL syntax error at RAM.v(19) near ";": Syntax error found at or before ;