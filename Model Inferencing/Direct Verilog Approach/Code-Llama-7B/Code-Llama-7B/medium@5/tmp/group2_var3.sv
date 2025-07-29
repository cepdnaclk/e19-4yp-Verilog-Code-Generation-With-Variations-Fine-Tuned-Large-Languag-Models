module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] Q1Q2[0:1];
integer i;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
    i = 0;
    for (i = i; i < 2; i = i + 1) begin
        Q1Q2[i] <= Q1;
        Q1Q2[i+1] <= Q2;
    end
end
endmodule

module example7_4_tb;
reg D;
wire Q1, Q2;
reg Clock;
// instantiate the module
example7_4 dut(.D(D),.Clock(Clock),.Q1(Q1),.Q2(Q2));
// clock generation
always
begin
    #10 Clock = 1;
    #10 Clock = 0;
end
// driving values for D
initial
begin
    D = 1;
    #20 D = 0;
    #20 D = 1;
    #20 $stop