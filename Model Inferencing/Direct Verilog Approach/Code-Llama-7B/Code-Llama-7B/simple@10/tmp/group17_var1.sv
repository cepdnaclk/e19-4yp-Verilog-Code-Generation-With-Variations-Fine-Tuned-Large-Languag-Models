```verilog
module ALU_signed (output logic signed [3:0] Result, input logic signed [3:0] ArgA, ArgB, input logic Clk);
wire signed [4:0] x = ArgA, y = ArgB, sum;
assign sum = x + y;
assign Result = x[3]? -sum[4:0] : sum[4:0];
specify
	specparam tRise = 5, tFall = 4;
	(Clk *> Result) = (tRise, tFall);
endspecify
endmodule
```
### Simulation
* Run simulation
![alt text](https://github.com/adnan-sagar/RISCV-CPU/blob/master/lab02/lab02SimOV.PNG)
* Output waveform
![alt text](