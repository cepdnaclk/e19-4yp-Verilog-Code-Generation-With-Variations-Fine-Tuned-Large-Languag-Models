module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [3:0] regs_arr[4:0];
reg [3:0] regs_arr_1[4:0];
integer i;
integer j;
always @(posedge Clock)
begin
    begin
        i = 0;
        j =