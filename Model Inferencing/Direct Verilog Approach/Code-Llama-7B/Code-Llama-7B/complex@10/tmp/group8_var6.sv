```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset) begin
  if (reset == 1) begin
    count <= 0;
  end
  else if (enable) begin
    case (count)
      {count[2: 0], 1'b1} inside {
        [4'b0000: 4'b0111],
        [4'b1110: 4'b1111]
      }: begin
         count <= {count[2: 0], 1'b1};
      end
      {count[2: 0], 1'b0} inside {
        [4'b1000: 4'b1100],
        [4'b0001: 4'b0011]
      }: begin
         count <= {count[2: 0], 1'b0};
      end
      default: begin
        count <= 0;
      end
    endcase
  end
end
endmodule
```
### Testbench Verilog Code:
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