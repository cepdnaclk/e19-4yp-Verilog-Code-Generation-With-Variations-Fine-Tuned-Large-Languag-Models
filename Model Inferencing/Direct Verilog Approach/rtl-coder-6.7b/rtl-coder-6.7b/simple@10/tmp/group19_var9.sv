module dff_tb;
integer i;
reg [7:0] a;
reg [7:0] b;
reg a_d, b_d;
wire [7:0] q1, q2;
reg clk, rstn;
dff_inst dffa (.D(a_d),.Clock(clk),.Resetn(rstn),.Q(q1));
dff_inst dffb (.D(b_d),.Clock(clk),.Resetn(rstn),.Q(q2));
initial
begin
$dumpfile("dff_tb.vcd");
$dumpvars(0, dff_tb);
end
initial
begin
a = 'b00001111; b = 'b11110000;
rstn = 1;
#1; #1; #1;
clk = 0;
rstn = 0;
#1; #1;
clk = 1;
rstn = 1;
#1; #1;
clk = 0;
if (q1!= a || q2!= b)
$display("Unexpected values on outputs.%d %d", q1, q2);
else
$display("Correct values on outputs.%d %d", q1, q2);
#1; #1;
a_d = 0; b_d = 1;
clk = 1;
#1; #1;
clk = 0;
a_d = 1; b_d = 0;
#1; #1;
clk = 1;
#1; #1;
clk = 0;
if (q1!= 1 || q2!= 0)
$display("Unexpected values on outputs.%d %d", q1, q2);
else
$display("Correct values on outputs.%d %d", q1, q2);
end
endmodule