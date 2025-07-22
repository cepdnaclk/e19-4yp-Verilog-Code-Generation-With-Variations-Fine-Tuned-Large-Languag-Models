### Testbench Code:
module dff_tb;
reg D, Clock, Resetn;
wire Q;

dff_inst dff_inst(.D(D),.Clock(Clock),.Resetn(Resetn),.Q(Q));

initial
begin
$monitor($time," D = %b, Clock = %b, Resetn = %b, Q = %b", D, Clock, Resetn, Q);

Resetn = 0;
Clock = 1;
#5
Resetn = 1;

#11
D = 1;
Clock = 0;
#5
Clock = 1;
#5
D = 0;
Clock = 0;
#5
Clock = 1;
#5
D = 1;
Clock = 0;
#5
Clock = 0;
#5
Clock = 1;
#5
$stop;
end

endmodule