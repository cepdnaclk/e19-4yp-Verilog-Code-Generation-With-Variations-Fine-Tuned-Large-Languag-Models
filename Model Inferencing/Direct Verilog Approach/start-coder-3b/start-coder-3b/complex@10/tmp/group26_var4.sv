```
### Include
`include "v_in_files.sv"

### module
module CarryTest(output CarryResult, input[1:0] Adjr, input Reset);

### module inside
`v_in_files

### Assign
reg[1:0] Adjr;
assign AdjustFreq = Adjr;

### Assign (CarryTest)
assign CarryResult = Adjr[0];

### Local Variables
localparam [47:0] range = "1";
reg [0:0] inside;
initial inside = 1'b1;
always @(posedge ClockIn)
begin
    inside <= inside ^ Reset;
end

### Always (CarryTest)
always @(posedge PLLClock)
begin
    if (Reset == 1)
        inside = range;
    else if (PLLClock == 1)
        inside = inside - 1;
end

### Always (Carry Test)
always @(posedge PLLClock)
begin
    if (Reset == 1)
        CarryResult = 1;
    else if (PLLClock == 1)
        CarryResult = CarryResult ^ inside[2];
end
### End module
```

## Testing

### Testbench:
```
module CarryTest(output CarryResult, input[1:0] Adjr, input Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
assign CarryResult = Adjr[0];
localparam [47:0] range = "1";
reg[0:0] inside;
initial inside = 1'b1;
always @(posedge ClockIn)
begin
    inside <= inside ^ Reset;
end
always @(posedge PLLClock)
begin
    if (Reset == 1)
        inside = range;
    else if (PLLClock == 1)
        inside = inside - 1;
end
always @(posedge PLLClock)
begin
    if (Reset == 1)
        CarryResult = 1;
    else if (PLLClock == 1)
        CarryResult = CarryResult ^ inside[2];
end
endmodule
```

### Testbench Interface:
```
module CarryTestBench (input ClockIn, PLLClock, Reset);
reg[1:0] Adjr;
reg[1:0] HiCount;
wire[1:0] AdjustFreq;
wire CarryResult;
JerkyComparator #(4, 4) comp(AdjustFreq, ClockIn, PLLClock, Reset);
CarryTest comp_2(CarryResult, Adjr, Reset);
initial begin
    Adjr = 2'b00;
    HiCount = 2'b0;
end
endmodule
```

## Vivado

```
### Top module
module CarryTest(output CarryResult, input[1:0] Adjr, input Reset);

### Module inside
`v_in_files

### Assign
reg[1:0] Adjr;
assign AdjustFreq = Adjr;

### Assign (CarryTest)
assign CarryResult = Adjr[0];

### Local Variables
localparam [47:0] range = "1";
reg [0:0] inside;
initial inside = 1'b1;
always @(posedge ClockIn)
begin
    inside <= inside ^ Reset;
end

### Always (CarryTest)
always @(posedge PLLClock)
begin
    if (Reset == 1)
        inside = range;
    else if (PLLClock == 1)
        inside = inside - 1;
end

### Always (Carry Test)
always @(posedge PLLClock)
begin
    if (Reset == 1)
        CarryResult = 1;
    else if (PLLClock == 1)
        CarryResult = CarryResult ^ inside[2];
end
### End module

### CarryTest Benchmark

### Top module
module CarryTestBench (input ClockIn, PLLClock, Reset);

### Module inside
`v_in_files

### Assign
reg[1:0] Adjr;
reg[1:0] HiCount;
wire[1:0] AdjustFreq;
wire CarryResult;
JerkyComparator #(4, 4) comp(AdjustFreq, ClockIn, PLLClock, Reset);
CarryTest comp_2(CarryResult, Adjr, Reset);
initial begin
    Adjr = 2'b00;
    HiCount = 2'b0;
end
endmodule

```
## Output Image

![Carry Test bench](https://github.com/d12c/System-Verilog/blob/main/Labs/Lab%205/Carry%20Test%20Bench.png)

## Results

Test Case             Result
-------------------- | ----------------------
Jerky Comparator     Pass
Carry Test Bench     Pass

## Conclusion

Through the execution of these two test cases we were able to conclude that the Jerky Comparator is functioning as intended and the Carry Test Bench is functioning as intended. 
/Labs/Lab 8/Lab 8.md
# Lab8

## Top level
### Verilog Code

```
module Lab8Top (
		output RegOut,
		output CountOut,
		input ClkIn,
		input EnableIn
	);

wire[7:0] count = 2'b0;
wire reg_out = 0;

localparam int_count_max = 7'h100;

always @(ClkIn)
begin
	if (EnableIn == 1)
		begin
			count <= (count+1);
			if (count == int_count_max)
				count = 2'b0;
			reg_out = count[1:0];
		end
end

assign RegOut = reg_out;
assign CountOut = count;

endmodule
```

### Vivado Code

```
module Lab8Top (
		output RegOut,
		output CountOut,
		input ClkIn,
		input EnableIn
	);

wire[7:0] count = 2'b0;
wire reg_out = 0;

localparam int_count_max = 7'h100;

always @(ClkIn)
begin
	if (EnableIn == 1)
		begin
			count <= (count+1);
			if (count == int_count_max)
				count = 2'b0;
			reg_out = count[1:0];
		end
end

assign RegOut = reg_out;
assign CountOut = count;

endmodule
```

## Testing

### Verilog Code

```
module Lab8Top (
		output RegOut,
		output CountOut,
		input ClkIn,
		input EnableIn
	);

wire[7:0] count = 2'b0;
wire reg_out = 0;

localparam int_count_max = 7'h100;

always @(ClkIn)
begin
	if (EnableIn == 1)
		begin
			count <= (count+1);
			if (count == int_count_max)
				count = 2'b0;
			reg_out = count[1:0];
		end
end

assign RegOut = reg_out;
assign CountOut = count;

endmodule

module Lab8Top_test;

initial begin
	RegOut = 0;
	CountOut = 2'b00;
	$monitor(RegOut, CountOut);
	$dumpfile("Lab8Top_test.vcd");
	$dumpvars(0, Lab8Top_test);
end

Lab8Top l_a (
.RegOut(RegOut),
.CountOut(CountOut),
.ClkIn(ClkIn),
.EnableIn(EnableIn)
);

always begin
	#2 ClkIn = ~ClkIn;
end

assign EnableIn = 1;

assign ClkIn = 1;

initial begin
	#10 ClkIn = 0;
end

initial begin
	#10 ClkIn = 1;
end

function automatic logic $finish();
endfunction

endmodule
```

### Vivado Code

```
module Lab8Top (
		output RegOut,
		output CountOut,
		input ClkIn,
		input EnableIn
	);

wire[7:0] count = 2'b0;
wire reg_out = 0;

localparam int_count_max = 7'h100;

always @(ClkIn