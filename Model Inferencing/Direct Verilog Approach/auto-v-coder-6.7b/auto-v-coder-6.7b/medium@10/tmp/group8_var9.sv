```verilog
module dec2_4beh(output reg [3:0] o, input reg [1:0] i);
	always @(i) begin
		if(i[1] == 1'b0) begin
			o = i[0]? 4'b0001 : 4'b0000;
		end else begin
			o = i[0]? 4'b0011 : 4'b0010;
		end
	end
endmodule
```
This is a simple 4-bit decoder using a multiplexer structure to select an output based on the input. It does so by using an if-else structure to differentiate between the two input signals. If the upper bit is 0, it selects the lower bit as the output, otherwise it selects the bit.

Please note that the enable signal is not used in this design, but if you want to add an enable signal in future, you can add the logic accordingly in the always block.

Also, the decoder is a combinational logic, so it does not need a clock to operate.### Verification Instruction:
Run the design and verify it by monitoring the outputs 'o' and 'i' changes over time. The output 'o' should match the input 'i' according to the decoder specification.

Verilog simulation commands:
```verilog
module tst_dec2_4beh();
wire [3:0]o;
reg[1:0] i;
dec2_4beh dec(o,i);
initial
begin
i =2'b00;
end
initial $monitor ($time, " output o = %b, input i = %b ", o,i);
initial #14 $stop; // Stop simulation
endmodule
```
In this testbench, a module named `tst_dec2_4beh` is defined. This module instantiates `dec2_4beh` with i as the input and o as the output. The initial block sets the initial value of i to 2'b00. The $monitor statement prints out the time, output o and input i at every simulation cycle. The simulation is stopped after 14 cycles