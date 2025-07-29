module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[2][3][2][1];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
	Storage[Adr] <= Ibus;
else begin
    int i;
    while (i <= 2) begin
        while (i <= 3) begin
            while (i <= 2) begin
                while (i <= 1) begin
		            ObusReg <= Storage[i][1][i][1];
                    i++;
                end
            end
        end
    end
end
endmodule
### Simplified Code:
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[2][3][2][1];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @