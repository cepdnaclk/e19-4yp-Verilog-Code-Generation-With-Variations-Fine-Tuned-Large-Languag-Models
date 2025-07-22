module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
begin
    if (Read==1'b0) begin
        Storage[Adr] <= Ibus;
    end
    else begin
        while(1) begin
            ObusReg <= Storage[Adr];
        end
    end
end
endmodule
### Variation Instruction:
Introduce a while loop condition using inside with array-slice operand and a constant