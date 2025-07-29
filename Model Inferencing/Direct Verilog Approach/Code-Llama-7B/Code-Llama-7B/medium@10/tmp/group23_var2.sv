module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else if (Adr>=2 && Adr<=7)
    ObusReg <= Storage[Adr];
endmodule
### Synthesis Log Output Content:
#### Synthesizes the code as a FlipFlop
#### Synthesizes the code as a RAM
### Code Review:
#### No data hazard and pipeline issues are addressed in this code.
#### Code is not synthesizable.
### Testbench
### Input
![Testbench Input](https://github.com/Biplav135/Computer-Architecture-Lab-2/blob/main/RAM/Testbench%20Input.PNG)
### Output
![Testbench Output](https://github.com/Biplav135/Computer-Architecture-Lab-2/blob/main/RAM/Testbench%20Output.PNG)
### Experimental Output
![Testbench Output](https://github.com/Biplav135/Computer-Architecture-Lab-2/blob/main/RAM/Experimental%20Output.PNG)
### Conclusion
#### Code is not synthesizable.
### Reference
#### 1. https://www.doulos.com/knowhow/verilog