```verilog
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else begin
    integer i = 0;
    while (i < 15) begin
        if (i == Adr) begin
            ObusReg <= Storage[i];
            break;
        end
        i = i + 1;
    end
end
endmodule
```
This variation of the base verilog code introduces a while loop condition to simulate the use of a condition to check if the address matches the address to be read. If a match is found, the value from the matching address is loaded into the ObusReg.

Please note that the 'break' statement in the while loop condition stops the loop once the match is found. Also, it's not an optimal solution for the code as it will not perform well if the address Adr is not in the range of 0 to 14. It would be better to use a 'case' statement or 'if-elseif' statement to achieve the same functionality. The while loop is used here for the sake of demonstrating the while loop condition. ###

Also, note that this variation assumes that the addresses are only integer from 0 to 14. If you want to address wider range of memory, you should change the array size and correspondingly adjust the while loop condition. The storage is addressed by integers from 0 to 14, and the RAM module assumes that Ibus and Obus are 8-bit wide. ###

The modified version of the code is not the best solution for memory addressing and data retrieval, and would be better suited for educational purposes. It would be better to use a more sophisticated and efficient implementation such as a memory lookup table or a data structure that supports direct indexing. That being said, it's important to remember that while looping is often used in the design of complex hardware, it should be used with caution in the context of digital design. ###