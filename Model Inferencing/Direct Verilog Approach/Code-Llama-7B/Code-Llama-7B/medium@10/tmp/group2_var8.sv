module example7_6(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] Q[2:0];
integer i;
always @(posedge Clock)
begin
    for(i = 0; i < 3; i = i + 1)
    begin
        Q[i][0] <= D;
        Q[i][1] <= Q[i][0];
    end
    Q1 <= Q[2][1];
    Q2 <= Q[1][1];
end
endmodule
### Screenshot:
![Screenshot](images/example-7-6.PNG)
### Code Example:
### Base Verilog Code:
module example7_7(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] Q[2:0];
integer i;
always @(posedge Clock)
begin
    i = 0;
    while(i < 3)
    begin
        Q[