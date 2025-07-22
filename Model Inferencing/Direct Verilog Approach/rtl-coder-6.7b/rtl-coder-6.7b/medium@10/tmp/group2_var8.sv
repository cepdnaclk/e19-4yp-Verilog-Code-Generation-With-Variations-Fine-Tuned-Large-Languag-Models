module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [15:0] arr;
initial begin
    arr[0] = 0;
    arr[1] = 1;
    arr[2] = 2;
    arr[3] = 3;
    arr[4] = 4;
    arr[5] = 5;
    arr[6] = 6;
    arr[7] = 7;
    arr[8] = 8;
    arr[9] = 9;
    arr[10] = 10;
    arr[11] = 11;
    arr[12] = 12;
    arr[13] = 13;
    arr[14] = 14;
    arr[15] = 15;
end
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    integer index;
    index = 0;
    while (arr[index])
    begin
        index = index + 1;
    end
end
endmodule
### Variation Comments:
### Testbench code:
`timescale 1ns / 1ps
module example7_4_TestBench;
reg D, Clock;
wire Q1, Q2;
example7_4 test1(.D(D),.Clock(Clock),.Q1(Q1),.Q2(Q2));
initial begin
    D = 0;
    Clock = 0;
    #1 Clock = 1;
    #1 Clock = 0;
    #1 D = 1; Clock = 1;
    #1 Clock = 0;
    #1 D = 0; Clock = 1;
    #1 Clock = 0;
    #1 D = 1; Clock = 1;
    #1 Clock = 0;
    #1 D = 0; Clock = 1;
    #1 Clock = 0;
    #1 D = 1; Clock = 1;
    #1 Clock = 0;
    #1 D = 0; Clock =