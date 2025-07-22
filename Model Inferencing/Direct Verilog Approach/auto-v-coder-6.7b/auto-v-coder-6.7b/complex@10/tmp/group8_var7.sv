```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
always @ (posedge clock, posedge reset)
if (reset == 1) count <= 0;
else if (enable) begin
  count <= {count[2:0], 1'b1};
end
generate
  for(genvar i=0; i<4; i++) begin
    always @(count) begin
      if (count == i) begin
        if(i == 3) begin
          count <= 0;
        end
        else begin
          count <= i+1;
        end
      end
    end
  end
endgenerate
endmodule
```

In this code, a generate block is used to iterate through the count values. `i` is the iteration variable. Inside each iteration, we check if the `count` matches the current iteration index. If it does, we move to the next state by incrementing the value of `count`. This process continues until the maximum count value is reached, which is then reset back to 0.

The `always` block is necessary to ensure that the count value changes on a clock edge. If the `count` value remains constant, the Johnson counter will not function properly.

This modified code provides a more efficient implementation of the Johnson counter. It uses a simple state machine approach to advance the count value, ensuring that it stays within the specified range. It also reduces the amount of complex logic needed within the single module. It does not use case statements like the original Johnson counter. This version is simpler and more efficient, but it's still a Johnson counter.