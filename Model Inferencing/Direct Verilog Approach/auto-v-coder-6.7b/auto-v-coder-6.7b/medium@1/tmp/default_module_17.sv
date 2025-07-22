```
module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);

wire [3:0] c_masked;
wire [1:0] s_masked;

assign c_masked = {3'b0, s[0]} & c;
assign s_masked = {1'b0, s[1]};

always @(*) begin
  case(s_masked)
    2'b00: z = ~s_masked[1] & ~s_masked[0] & c_masked[0]; // Select c[0] when s=00
    2'b01: z = ~s_masked[1] & s_masked[0] & c_masked[1]; // Select c[1] when s=01
    2'b10: z = s_masked[1] & ~s_masked[0] & c_masked[2]; // Select c[2] when s=10
    2'b11: z = s_masked[1] & s_masked[0] & c_masked[3]; // Select c[3] when s=11
    default: z = 1'bx;
  endcase
end
endmodule
```
This code creates a 4-bit mask for `c` and `s` and uses this to select the correct output. The `always @(*)` block ensures that the selected output is calculated whenever the inputs change. Note that the `default` case is for handling any unexpected inputs, `1'bx` indicates an undefined state.