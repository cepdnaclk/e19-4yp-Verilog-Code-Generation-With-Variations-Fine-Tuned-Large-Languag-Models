module example7_8(Clock, f, g, h);
input Clock;
output f, g, h;
reg f, g, h;
begin
    f = 0;
    g = 0;
    h = 0;
    always @(posedge Clock)
    begin
        if (f & g) f = 0;
        else if (f | g) f = h;
        else if (f & g | g & h) f = 0;
        else f = 0;
        if (g & h) g = 0;
        else if (g | h) g