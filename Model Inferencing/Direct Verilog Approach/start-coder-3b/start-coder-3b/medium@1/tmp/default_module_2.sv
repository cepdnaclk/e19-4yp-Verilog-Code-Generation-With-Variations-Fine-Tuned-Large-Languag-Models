module example7_15(clock, D, Q);
input clock;
output D,Q;
reg Q;
always @ (posedge clock)
begin
int i;