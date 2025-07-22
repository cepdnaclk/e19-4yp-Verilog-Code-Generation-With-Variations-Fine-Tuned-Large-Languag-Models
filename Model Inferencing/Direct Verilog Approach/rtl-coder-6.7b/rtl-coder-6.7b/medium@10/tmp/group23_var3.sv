module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    int j;
    while (j <= 15) begin
        ObusReg <= Storage[j];
        j = j + 1;
    end
end
### Variation Instruction:
Introduce a while loop