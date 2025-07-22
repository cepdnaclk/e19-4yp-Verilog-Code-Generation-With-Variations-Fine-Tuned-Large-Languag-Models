module dffe(output reg out,input data, input enable);
reg s_out;
assign out = (enable)? data : s_out;
always@(posedge data) //assign s_out = (enable)? data : s_out;
begin
s_out = data;
end
endmodule
module tst_dffbeh;//test-bench
reg di,en;
wire do;
dffe d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #3 di=~di; // Toggle data every 3 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule