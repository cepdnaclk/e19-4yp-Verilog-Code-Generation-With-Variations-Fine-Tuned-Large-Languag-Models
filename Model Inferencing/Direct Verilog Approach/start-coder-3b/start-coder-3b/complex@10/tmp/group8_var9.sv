module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
4'b0000,
4'b0001,
4'b0011,
4'b0111: count <= {count[2: 0], 1'b1};
4'b1111,
4'b1110,
4'b1100,
4'b1000: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
initial begin
clock = 0;
reset = 1;
enable = 0;
end
initial fork
join
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1; end
initial begin reset = 0; enable = 1;