module EventCtlPart(output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin
    case(b)
        3'd0: begin
            if (a)
                xReg <= c;
            else
                xReg <= (c | a);
        end
        3'd1: begin
            if (a)
                xReg <= (c &!a);
            else
                xReg <= ((a &!c) ^ c);
        end
        3'd2: begin
            if (a)
                xReg <= (c &!a);
            else
                xReg <= (c | a);
        end
        3'd3: begin
            if (a)
                xReg <= c;
            else
                xReg <= ((a & c) ^ c);
        end
    endcase