```verilog
module EventCtlPart (output xPart, yPart, input a, b, c, d);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b, c)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    if (d >= 10 & d < 20) begin
        // 3D array slice
        int array3D[4:0][4:0][4:0];
        array3D[d-10][2][1] = 1;
    end
end
endmodule
```
This code includes a nested if statement where if `d` is within the range 10 to 19, a 3D array slice is selected using the `d` variable as an index. The 3D array slice is then assigned a value of 1. Please note that the `d` variable must be an integer type and the 3D array needs to be declared. If the array is declared with more than 3 dimensions, the additional dimensions can be sliced as well. 

Make sure to test with correct inputs for verfication. If the input type is `integer`, the `d` should be an integer in the range of your array size. Similarly, the dimensions of the 3D array should be according to your requirements.

This is a simple example and doesn't implement any complex logic or functionality. This code is intended for educational purposes, to show how you can incorporate a nested if statement in a Verilog code. This example does not represent any real-world functionalities. In a real-world scenario, you may need to adapt the code according to your particular needs.