module example7_5(Clock, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8);
input Clock;
output Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8;
reg Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8;
reg [15:0] array_1 [4:0];
integer k;
always @(posedge Clock)
begin
    array_1[0] <= Q1;
    // Change loop to use a while condition
    while (k < 4)
    begin
        array_1[k + 1] <= array_1[k];
        k = k + 1;
    end
    Q2 <= array_1[0];
    Q3 <= array_1[1];
    Q4 <=