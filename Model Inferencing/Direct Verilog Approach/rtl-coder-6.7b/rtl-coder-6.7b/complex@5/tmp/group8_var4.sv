module Johnson_Counter#(parameter SIZE = 4)
(count, enable, clock, reset);
output [SIZE - 1: 0] count;
input enable;
input clock, reset;
reg [SIZE - 1: 0] count;
localparam int CNT_ARR[8] = '{4'b0000, 4'b0001, 4'b0011, 4'b0111, 4'b1111, 4'b1110, 4'b1100, 4'b1000};
localparam int NUM_CNT = CNT_ARR.size();
always @ (posedge clock, posedge reset)
if (reset == 1) count <= CNT_ARR[0];
else if (enable)
begin
`ifdef inside
if(count inside {CNT_ARR})
`else
if(|(count == CNT_ARR))
`endif
count <= CNT_ARR[count + 1 % NUM_CNT];
else count <= CNT_ARR[0];
end
endmodule

module t_Johnson_Counter#(parameter SIZE = 4) ();
wire [SIZE - 1: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter#(.SIZE(SIZE)) M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule