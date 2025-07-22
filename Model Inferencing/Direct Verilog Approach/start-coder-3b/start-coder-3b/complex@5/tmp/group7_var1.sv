import sys
f_in = open("alu.v","r")
f_out = open("alu_v.v","w")
f_ins = open("alu_inputs.txt","w")
lines = f_in.readlines()
for line in lines:
    if ((line.find("A")!=-1) or (line.find("B")!=-1)):
        print line
        f_ins.write(line.split("[")[0].split("(")[1])
        f_ins.write(" ")
    f_out.write(line)
f_in.close()
f_out.close()
f_ins.close()/HW4/README.md
## Homework 4: 

### Objective:

To demonstrate understanding of combinational logic and to write a program for it. (i.e., `a+b` with `a` and `b` having a finite number of input bits)

### Design:

- Create a combinational adder.
- Use Verilog syntax.
- Test the output for `000`, `001`, `010`, `011`, `110`, `111`.
- Use the TestBench file for testing the output.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW4/img/results.PNG)/HW10/README.md
## Homework 10: 

### Objective:

To demonstrate understanding of the counter.

### Design:

- Create a counter.
- Use Verilog syntax.
- Test the output for `0, 1, N-1` after N+1 clock cycles
- Use the TestBench file for testing the output.
- Check counter is working as a 4-bit counter.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW10/img/results.PNG)/HW1/README.md
## Homework 1: 

### Objective:

To demonstrate understanding of the combinational logic and to write a program for it.

### Design:

- Create a combinational adder.
- Use Verilog syntax.
- Test the output for `000`, `001`, `010`, `011`, `110`, `111`.
- Use the TestBench file for testing the output.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW1/img/results.PNG)/HW12/README.md
## Homework 12: 

### Objective:

To demonstrate understanding of the RAM and to write a program for it.

### Design:

- Create a RAM.
- Use Verilog syntax.
- Test the output with the TestBench file.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW12/img/results.PNG)/HW3/README.md
## Homework 3: 

### Objective:

To demonstrate understanding of the sequential logic and to write a program for it.

### Design:

- Create a sequential adder.
- Use Verilog syntax.
- Test the output for `000`, `100`, `110`, `101`, `111`.
- Use the TestBench file for testing the output.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW3/img/results.PNG)/HW8/README.md
## Homework 8: 

### Objective:

To demonstrate understanding of the register.

### Design:

- Create a register.
- Use Verilog syntax.
- Test the output for `000`, `001`, `010`, `011`, `110`, `111`.
- Use the TestBench file for testing the output.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW8/img/results.PNG)/HW5/README.md
## Homework 5: 

### Objective:

To demonstrate understanding of the flip flop and to write a program for it.

### Design:

- Create a D flip flop.
- Use Verilog syntax.
- Test the output for `0, 1` and `1, 0` after N+1 clock cycles
- Use the TestBench file for testing the output.
- Check D flip flop is working as a 4-bit flip flop.

### Result:

![img](https://github.com/vishaljain007/CSCE-411-Verilog-FPGA/blob/master/HW5/img/results.PNG)/HW10/V_Src/counter_tb.v

module counter_tb(counter_d);
	reg [3:0] counter_d;
	reg clk, reset;
	reg [3:0] test_a, test_b, test_c;
	reg [3:0] count_a, count_b, count_c;
	reg [0:0] a, b, c, d, e, f, g;

	wire [3:0] count_result;
	reg [3:0] actual_result;

	assign actual_result = counter_d;

	initial begin
		clk = 1'b0;
		count_result = 4'b0000;
		test_a = 4'b0000;
		test_b = 4'b0000;
		test_c = 4'b0000;
		count_a = 4'b0000;
		count_b = 4'b0000;
		count_c = 4'b0000;
		repeat(9) begin
			#1 clk = ~clk;
		end
		count_result = 4'b1111;
	end

	always #50 begin
		count_result = 4'b0000;
	end

	always @(*) begin : clk_count
		#1 clk = ~clk;
		if(!reset) begin
			count_result = count_result + 1;
			actual_result = count_result;
		end
		else begin
			if (count_a>4'b0000 && count_a<=4'b0000 && clk) begin
				count_result = 4'b0000;
				test_a = count_a;
				count_a = count_result;
			end
			else if (count_a>4'b0000 && count_a<=4'b0001 && clk) begin
				count_result = 4'b0001;
				test_b = count_a;
				count_a = count_result;
			end
			else if (count_a>4'b0001 && count_a<=4'b0010 && clk) begin
				count_result = 4'b0010;
				test_c = count_a;
				count_a = count_result;
			end
			
			if (count_b>4'b0000 && count_b<=4'b0000 && clk) begin
				count_result = 4'b0000;
				test_a = count_b;
				count_b = count_result;
			end
			else if (count_b>4'b0000 && count_b<=4'b0001 && clk) begin
				count_result = 4'b0001;
				test_b = count_b;
				count_b = count_result;
			end
			else if (count_b>4'b0001 && count_b<=4'b0010 && clk) begin
				count_result = 4'b0010;
				test_c = count_b;
				count_b = count_result;
			end

			if (count_c>4'b0000 && count_c<=4'b000