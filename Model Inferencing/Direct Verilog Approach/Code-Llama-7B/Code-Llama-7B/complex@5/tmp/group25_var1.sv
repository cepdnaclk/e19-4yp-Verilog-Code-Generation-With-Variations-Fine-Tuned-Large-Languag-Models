```verilog
module encoder (BCD_in, Excess_3_out);
input [3:0] BCD_in;
output [3:0] Excess_3_out;
assign Excess_3_out = BCD_in + 3;
endmodule

module t_encoder();
reg [3:0] BCD_in;
wire [3:0] Excess_3_out;
encoder M0(BCD_in, Excess_3_out);
initial
$monitor($time,,"BCD = %b, Excess-3 Code = %b", BCD_in, Excess_3_out);

initial begin
end
initial begin //Simulation Test Pattern
end
initial begin
for (int i=0; i<4; i++)
    	HiCount <= i[3:0];
end
always @(HiCount) begin
	for (int j=0; j<4; j++)
		if (inside(HiCount, {j,j,j,j}))
			Adjr[j] <= {4{j[3:0]}};
end
generate
	genvar i;
	for (i=0; i<4; i++)
		assign Excess_Code[i] = Excess_3_out + Adjr[i];
endgenerate
endmodule
```
### Output:
```
$ vlog -sv t_encoder.sv
$ vvp t_encoder.vvp
```
![alt tag](https://raw.githubusercontent.com/chunyang-wen/verilog-assignment/master/assignment1/variation.png)

### Questions:
1. What is the maximum possible value of Excess_3_out?
2. What is the maximum possible value of Excess_Code[i