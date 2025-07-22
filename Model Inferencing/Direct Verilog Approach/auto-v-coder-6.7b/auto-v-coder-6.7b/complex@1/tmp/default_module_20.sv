```verilog
module state_Mealy(input clk, reset, input [31:0] data_in, output reg [31:0] out);
reg [31:0] state;
initial state=32'd0;
always @(posedge clk, posedge reset)
begin
  if (reset) state <= 32'd0;
  else begin
    if (state == 32'd0) begin
      if (data_in == 32'd1) begin
        state <= 32'd1;
        out <= data_in;
      end else begin
        state <= 32'd0;
        out <= 'bx;
      end
    end else begin
      if (data_in == 32'd2) begin
        state <= 32'd2;
        out <= 32'd2;
      end else begin
        state <= 32'd0;
        out <= 'bx;
      end
    end
  end
end
endmodule
```
Please replace `clk, reset, data_in, out` with your actual signals. 

The code is a state machine that transitions between states 0 and 1 and 2 based on the input `data_in`. The state 0 represents an idle state. In state 0, if `data_in` is 1, it transitions to state 1 and sends 1 to the output. In state 1, if `data_in` is 2, it transitions to state 2 and sends 2 to the output. Otherwise, it goes back to state 0 and sends a 'b (don't care) value to the output. 

The `reset` signal acts as a reset signal that resets the state machine to state 0. 

Replace the `out` with the right logic to your design. If you want to send a 'b (don't care) value to the output in a state, you can use `'bx`. If you want to send a specific value to the output, you can use a specific numerical value.

You should also replace the actual clock signal in the `posedge clk, posedge reset` with your actual clock signal.

The code is written in Verilog and