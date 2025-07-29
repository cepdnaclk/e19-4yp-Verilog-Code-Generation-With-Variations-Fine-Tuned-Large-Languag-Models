module example7_4_6(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] my_arr;
always @(posedge Clock)
begin
    my_arr[0] <= D;
    my_arr[1] <=