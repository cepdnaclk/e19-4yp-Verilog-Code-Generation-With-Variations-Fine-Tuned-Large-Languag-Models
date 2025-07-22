module RAM_Write_Operation (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
endmodule
### Verification:
Verification is done using the same test code we did in the previous section.
### Result:
![Screenshot from 2021-05-27 03-41-03](https://user-images.githubusercontent.com/63580613/119722