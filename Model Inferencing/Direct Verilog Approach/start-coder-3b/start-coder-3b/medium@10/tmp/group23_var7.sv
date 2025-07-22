module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else if (Clock==1'b1 && Read==1'b1)
    ObusReg <= Storage[Adr];
endmodule
### Comments:
The modified code shows that the read operation takes place when the read and write signals are active.

## 12.14

### Base Verilog Code:
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else if (Clock==1'b1 && Read==1'b1)
    ObusReg <= Storage[Adr];
endmodule
### Variation Instruction:
The instruction will add a delay before the read operation and the read operation will be controlled by both the write signal