```verilog
module mux24b(
input wire [3:0] a [0:3],
input wire [3:0] b [0:3],
input wire s [0:3],
output reg [3:0] y [0:3]
);
always @(*)
begin
	for (int i = 0; i <= 3; i = i + 1)
	begin
		if(s[i] == 0)
		y[i] = a[i];
		else
		y[i] = b[i];
	end
end
endmodule
```
### Variation:
### Original Code:
```verilog
module mux24b(