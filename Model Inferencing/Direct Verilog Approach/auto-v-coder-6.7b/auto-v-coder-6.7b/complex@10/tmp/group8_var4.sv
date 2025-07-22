```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;

always @ (posedge clock, posedge reset) 
if (reset == 1) count <= 0;
else if (enable) begin
  case (count)
    4'b0000, 4'b0001, 4'b0011, 4'b0111: count <= {count[2: 0], 1'b1};
    4'b1111, 4'b1110, 4'b1100, 4'b1000: count <= {count[2: 0], 1'b0};
    default: count <= 0;
  endcase
end
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);

initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end

always @(posedge clock) begin
  if (count == 4'b1000 || count == 4'b0000) begin
    $monitor("Count: %b", count);
  end
end

initial begin
  reset = 0;
  enable = 1;
  #10;
  reset = 1;
  #20;
  reset = 0;
  #100;
  $finish;
end
endmodule
```

With this modification, you can monitor the values of `count` when it cycles back to 0 (i.e., when `count` is 8 or 0) in the waveform viewer. This will provide a visual representation of the Johnson counter's behavior during its execution.

Please note that the verilog code is tested using `iverilog`. Hence, the wave viewer output may not be consistent with different simulators. 

For actual simulation, it is recommended to use a waveform viewer such as `