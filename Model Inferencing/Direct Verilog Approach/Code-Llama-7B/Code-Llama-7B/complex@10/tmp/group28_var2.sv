module tstdlatch;
localparam [1:0] ST_IDLE = 2'b00, ST_P0 = 2'b01, ST_P1 = 2'b10;
reg d, en;
wire q, qb;
// dlatch ff(en, d, q, qb);
initial
begin
d = 1'b0;
en = 1'b0;
end
always #4 en =~en;
always #8 d=~d;

reg [1:0] state;
reg [1:0] nextstate;
reg clk;
always #2 clk =~clk;

always @(posedge clk)
begin
case(state)
ST_IDLE:
begin
if (en==0)
nextstate=ST_IDLE;
else
nextstate=ST_P0;
end
ST_P0:
begin
if (en==0)
nextstate=ST_IDLE;
else
begin
if (d==0)
nextstate=ST_P1;
else
nextstate=ST_P0;
end
end
ST_P1:
begin
if (en==1)
nextstate=ST_P1;
else
nextstate=ST_P0;
end
default:nextstate=ST_IDLE;
endcase
end
always @(nextstate)
begin
state <= nextstate;
end
initial $monitor($time," en = %b, d = %b, state=%b ", en,d,state);
initial #40 $stop;
endmodule