module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    xReg <= a & b & c;
    yReg <= (b | c) ^ a;
    begin: Tb2
        if (a)
        begin: Tb3
            if (b)
            begin: Tb4
                if (c)
                begin: Tb5
                    xReg <= 1;
                end
                else
                begin: Tb6
                    xReg <= 0;
                end
            end
            else
            begin: Tb7
                if (c)
                begin: Tb8
                    xReg <= 0;
                end
                else
                begin: Tb9
                    xReg <= 0;
                end
            end
        end
        else
        begin: Tb10
            if (b)
            begin: Tb11
                if (c)
                begin: Tb12
                    yReg <= 1;
                end
                else
                begin: Tb13
                    yReg <= 0;
                end
            end
            else
            begin: Tb14
                if (c)
                begin: Tb15
                    yReg <= 0;
                end
                else
                begin: Tb16
                    yReg <= 0;
                end
            end
        end
    end
end
endmodule
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
1
1
0
###
0
###
0
###
###
0
###
0
###
0
###
0
###
0
###
0
###