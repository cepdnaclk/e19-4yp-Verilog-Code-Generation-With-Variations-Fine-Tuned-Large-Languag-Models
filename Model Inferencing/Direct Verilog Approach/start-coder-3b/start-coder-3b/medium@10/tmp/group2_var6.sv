### Modified Verilog Code:
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
reg [1:0] loop;
always @(posedge Clock)
begin
	Q1 <= D;
	Q2 <= Q1;
	while (loop < 2) begin
	Q2 <= Q1;
	loop <= loop + 1;
end
end
endmodule
###
###
###
###
##
Instructor's Solution
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
begin
    Q1 <= D;
    Q2 <= Q1;
end
endmodule
###
###
###
###
##
5. The following circuit is fed by a clock signal named CLK. The input signal named D is also fed by a clock signal. Its output signal named Q is fed by a clock signal. There are three sequential circuits which are:
A) Q = D
B) Q = Q
C) Q = (!Q)
What are the values of Q, when the input D is given low, and when the input D is given high?
A) Q=0 for D=0; Q=1 for D=1
B) Q=0 for D=0; Q=0 for D=1
C) Q=0 for D=0; Q=1 for D=1
D) Q=1 for D=0; Q=0 for D=1
E) Q=1 for D=0; Q=1 for D=1
Solution: Option D
###
###
###
###
##
Instructor's Solution
A: Q=0 for D=0
B: Q=0 for D=0
C: Q=0 for D=0
D: Q=1 for D=0
E: Q=1 for D=0
###
###
###
###
##