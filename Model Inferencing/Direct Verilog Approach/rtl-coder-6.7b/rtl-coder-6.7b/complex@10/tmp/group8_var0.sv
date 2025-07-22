```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
reg [3: 0] pattern [0: 4] = '{4'b0001, 4'b0011, 4'b0111, 4'b1111, 4'b1110};
generate
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable)
case (count)
pattern[0],
pattern[1],
pattern[2],
pattern[3]: count <= {count[2: 0], 1'b1};
pattern[4],
pattern[0],
pattern[1],
pattern[2]: count <= {count[2: 0], 1'b0};
default: count <= 0;
endcase
endgenerate
endmodule
```
### Testbench:
```verilog
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
```