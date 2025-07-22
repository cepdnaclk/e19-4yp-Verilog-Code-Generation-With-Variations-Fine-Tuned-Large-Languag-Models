module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
parameter CODES = {4'b0101, 4'b1100, 4'b1010, 4'b0011, 4'b0111, 4'b1110, 4'b1101, 4'b1001};
generate
if (count inside {CODES[0], CODES[1], CODES[2], CODES[3], CODES[4], CODES[5], CODES[6], CODES[7]})
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
CODES[0],
CODES[1],
CODES[2],
CODES[3]: count <= {count[2: 0], 1'b1};
CODES[4],
CODES[5],
CODES[6],
CODES[7]: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
endgenerate
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