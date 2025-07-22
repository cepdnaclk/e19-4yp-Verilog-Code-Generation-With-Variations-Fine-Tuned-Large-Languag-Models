```verilog
module EventCtlPart (output xPart, yPart, input a, b, c);
parameter [0:2][0:2][0:2] array = '{default:0}
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b, c)
begin: PartList
    if (a == 0)
        xReg <= array[0][b][c];
    else
        xReg <= array[1][b][c];
        
    if (a == 0 && b == 0)
        yReg <= array[0][0][c];
    else if (a == 0 && b == 1)
        yReg <= array[0][1][c];
    else if (a == 0 && b == 2)
        yReg <= array[0][2][c];
    else if (a == 1 && b == 0)
        yReg <= array[1][0][c];
    else if (a == 1 && b == 1)
        yReg <= array[1][1][c];
    else if (a == 1 && b == 2)
        yReg <= array[1][2][c];
    else
        yReg <= array[2][b][c];
end
endmodule
```
In this code, an input 'a' is used to select between two different 3D arrays. The selection of 'b' and 'c' within each array is done inside a nested if block which checks if 'b' and 'c' values are inside the specified range.

Please note that the values in the 'array' 3D array should be replaced with actual desired values according to your application specific conditions. If 'a' has a value that is not 0 or 1, then 'yReg' will output the value of 'array[2][b][c]'. 

Also, the values of 'b' and 'c' should be replaced with actual values that are defined in your code. They are set to 0, 1, and 2 in this example. If you want to use a different range of values for 'b' and 'c', you would need to adjust the conditions in the if-else statement accordingly.

Remember,