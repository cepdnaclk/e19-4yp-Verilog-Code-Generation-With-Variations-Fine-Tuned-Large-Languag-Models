```
module dffbehen(output reg q,input d,input en);
parameter real init_delay=36;
parameter real tpd=2;
parameter real tphl=4;
parameter real tphh=10;
parameter real tpcq=3;
parameter real tpcd=2;
initial
begin
q=1'b0;
#init_delay;
end
always @(posedge clk