module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
wire [3: 0] a;
generate
assign a = {count[2: 0], 1'b0};
endgenerate //generate
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
count <= {count[2: 0], 1'b1};
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
endmodule