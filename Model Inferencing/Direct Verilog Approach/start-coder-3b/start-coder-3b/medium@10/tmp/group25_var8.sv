module example7_12(enable, reset, Clock, out);
input enable;
input reset;
input Clock;
output out;
reg out;
logic f;
always @*
begin
    if (reset)
        out = 0;
    else if (enable)
        out = 1;
    else if (f)