module testbench;
reg [2**14:0] D;
reg Clock, Resetn;
wire [2**14:0] Q;
dff_inst inst(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));
initial begin
D = 0;
forever
#10 Clock = ~Clock;
end
initial begin
Resetn = 1'b0;
#15 Resetn = 1'b1;
#20;
D = 1'b1;
#20;
D = 1'b10;
#20;
D = 1'b100;
#20;
D = 1'b1000;
#20;
D = 1'b10000;
#20;
D = 1'b100000;
#20;
D = 1'b1000000;
#20