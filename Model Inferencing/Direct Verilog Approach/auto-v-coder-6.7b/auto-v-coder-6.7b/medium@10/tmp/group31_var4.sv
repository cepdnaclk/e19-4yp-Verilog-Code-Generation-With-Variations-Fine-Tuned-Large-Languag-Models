```verilog
module EventCtlPart (output reg xPart, yPart, input a, b, c);
reg [2:0] xReg, yReg;
logic [3:0] a, b, c;

assign xPart = xReg;
assign yPart = yReg;

always @(a, b, c)
begin: PartList
    if(a >= b)
        begin
            if(a <= c)
            begin
                if(b >= c)
                    xReg <= 0;
                else
                    xReg <= 1;
            end
        end
    else
        xReg <= 2;

    if(b >= c)
        yReg<= 0;
    else
        begin
            if(a >= c)
                yReg <= 1;
            else
                yReg <= 2;
        end

end

endmodule
```

This Verilog code introduces a nested if statement to determine if a is within b and c's range. It also introduces another nested if statement to determine if b is within c's range. If a is outside of b and c's range, xReg is set to 2. If a is within b and c's range, xReg is set to 0 if b is also within c's range and 1 otherwise. Similarly, if b is outside of c's range, yReg is set to 0. If a is within c's range, yReg is set to 1, otherwise it is 2. Note that this code currently assumes that a, b, and c are binary signals (i.e., 1-bit values). You would need to adjust this code depending on how you want to represent the ranges. 

Also, the syntax might not be correct as it was written in a plain text editor. Test the code in a simulator or synthesis tool to ensure it works correctly.###```verilog
module EventCtlPart (output reg xPart, yPart, input a, b, c);
reg [2:0] xReg, yReg;
logic [3:0] a, b, c;

assign xPart = xReg;
assign yPart = yReg;

always @(a, b, c)
begin: