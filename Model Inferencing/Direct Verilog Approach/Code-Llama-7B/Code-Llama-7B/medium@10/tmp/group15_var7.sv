````verilog
timescale 1ns/100ps
module ALU8_test (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);

always_comb begin // Changes
	case (mode)
		0: ALUout = left[0+:8] + right[0+:8];
		1: ALUout = left[0+:8] - right[0+:8];
		2: ALUout = left[0+:8] & right[0+:8];
		3: ALUout = left[0+:8] | right[0+:8];
		default: ALUout = 8'bX;
	endcase
end
endmodule
````
### Summary:
In the first version, case statement is used to make the ALU work on four input modes. The problem with this code is that case statement will consume more area than the selected operation. In the second version, only one case statement is used with part-select to make the ALU work on four input modes.

### What do we learn from this?