```verilog
module EventCtlPart (output xPart, yPart, input a, b, c, d[5:0], e[2:0]);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if (d[5:0] inside {[0:20]}) begin
        xReg <= a & b & c;
        yReg <= (b | c) ^ a;
    end
    else if (e[2:0] inside {[0:5]}) begin
        xReg <= a | b;
        yReg <= a & b;
    end
    else begin 
        xReg <= a & b;
        yReg <= a | b;
    end
end
endmodule
```
### Change Explanation:
In the modified code, we have added a nested if statement with a 3D array slice selected by variable `d[5:0]` and `e[2:0]`. Inside this if statement, we checked for range inclusion using the `inside` keyword. If the 3D array slice `d[5:0]` is inside the range `[0:20]`, then we set `xReg` and `yReg` accordingly. Otherwise, if `e[2:0]` is inside the range `[0:5]`, we set `xReg` and `yReg` accordingly. If neither of the above cases is true, we set `xReg` and `yReg` to default values. 

This change allows for more complex control flow and logic based on the input data, making the code more flexible and powerful. Note that this is a very simple example and could be extended or modified for more complex use-cases. 

Remember that the ranges used here are just placeholders and should be replaced with actual ranges based on the specific requirements of the design. 

Also, please note that this code will not synthesize correctly if compiled outside of a Verilog environment or in a tool that doesn't support Verilog's "inside" keyword, such as Modelsim, GHDL, or Xilinx Vivado. In those