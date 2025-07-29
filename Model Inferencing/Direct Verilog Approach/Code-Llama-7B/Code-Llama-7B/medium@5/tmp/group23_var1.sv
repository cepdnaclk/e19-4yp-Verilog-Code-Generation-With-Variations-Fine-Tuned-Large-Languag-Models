module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule
module top (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
RAM u0 (Obus, Ibus, Adr, Clk, Read);
endmodule
### Synthesized Code:
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
endmodule
module top (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
logic [7:0] _RW_Storage_Storage[0:15];
assign Obus = _RW_Storage_Storage[Adr];
RAM u0 (Ibus, _RW_Storage_Storage[Adr], Adr, Clk, Read);
endmodule

### Base Verilog Code:
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #