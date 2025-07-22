module example7_4(D, Clock, Q1, Q2, D_n1, Q1_n1);
input D, Clock;
output Q1, Q2, D_n1, Q1_n1;
reg Q, Q1, Q2;

always @(posedge Clock)
begin
Q <= D;
end

always @ (posedge Clock)
begin
Q1 <= Q;
end

always @ (posedge Clock)
begin