```verilog
module Johnson_Counter (count, enable, clock, reset, n);
parameter N = 8;
output count;
input enable;
input clock, reset;
reg [2: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
3'b000,
3'b001,
3'b011,
3'b111: count <= {count[1: 0], 1'b1};
3'b111,
3'b110,
3'b100,
3'b000: count <= {count[1: 0], 1'b0};
default: count <= 0;
endcase
endmodule

module t_Johnson_Counter ();
wire [7: 0] count;
wire [7: 0] n;
reg [2: 0] johnson_count [8: 0];
reg enable;
reg clock, reset;
initial begin
for (int i = 0; i < 9; i = i + 1) begin
johnson_count[i] = 0;
end
end
integer i;
generate
for (i = 0; i < 9; i = i + 1) begin: gen
Johnson_Counter M0 (johnson_count[i], enable, clock, reset, i);
end
endgenerate
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
join
assert property (@ (posedge clock) (inside({johnson_count[0], johnson_count[1], johnson_count[2], johnson_count[3], johnson_count[4], johnson_count[5], johnson_count[6], johnson_count[7], johnson_count[8]})));
endmodule
```
### Variation Instruction:
Use a generate with for loop to wrap the Johnson