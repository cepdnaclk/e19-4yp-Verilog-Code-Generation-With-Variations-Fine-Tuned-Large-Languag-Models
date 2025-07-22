module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
begin
integer i;
i = 0;
while (i < 3)
    begin
    Storage[i] <= Ibus;
    i = i + 1;
    end
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
end
endmodule