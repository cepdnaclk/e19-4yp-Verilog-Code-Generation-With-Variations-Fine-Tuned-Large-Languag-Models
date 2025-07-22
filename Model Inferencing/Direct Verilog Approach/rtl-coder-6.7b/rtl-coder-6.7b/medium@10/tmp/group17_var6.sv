module mux41b (
input wire [3:0] c,
input wire [1:0] s,
output wire z
);
// Add case
assign z = case (s)
2'b00: c[0];
2'b01: c[1];
2'b10: c[2];
2'b11: c[3];
endcase;
endmodule
## Task
### 1. Write RTL model of the 4:1 mux shown in the figure. It should be synthesizable and should use structural verilog without a case block.



### 2. Write a structural verilog module that combines two 4:1 muxes into a 2:1 multiplexer. The input c is a 8-bit wide bus and s is a single-bit bus. The output z is also a 8-bit wide bus. The following figure shows the desired connections.