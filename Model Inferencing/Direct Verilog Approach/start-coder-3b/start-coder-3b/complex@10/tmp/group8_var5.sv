module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
generate
for (i = 0; i < 4; i++) begin : John_Counter
Johnson_Counter M0 (count[i], enable, clock, reset);
end
endgenerate
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
endmodule

### Simulation Results:

#### Johnson Counter Simulation Results

#### Johnson Counter Simulation Results

## 6.3.1 Johnson Counter Simulation Results

### 6.3.1.1 Johnson Counter Simulation Results