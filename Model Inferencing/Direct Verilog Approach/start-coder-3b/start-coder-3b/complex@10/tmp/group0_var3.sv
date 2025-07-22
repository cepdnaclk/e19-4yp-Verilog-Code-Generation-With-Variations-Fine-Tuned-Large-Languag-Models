module tst_or_gate();
reg[3:0]a;
reg[3:0]b;
reg[3:0]c;
reg en;
wire d;
or_gate gg(d,a,b,c,en);
initial
begin
a = 4'h