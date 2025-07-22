module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  initial $display ("%m: Top-level testbench module"); // Display testbench name
  initial $monitor($time," clk=%b, di=%b, do=%b",clk,di,do[di]);
endmodule
### Result:
%m: Top-level testbench module
clk=0, di=0, do=0
clk=1, di=0, do=0
clk=0, di=0, do=1
clk=1, di=0, do=1
clk=0, di=0, do=0
clk=1, di=1, do=0
clk=0, di=1, do=0
clk=1, di=1, do=0
clk=0, di=1, do=1
clk=1, di=1, do=1
clk=0, di=1, do=0
clk=1, di=1, do=0
clk=0, di=1, do=1
clk=1, di=1, do=1
### End of result

# 12.09.2019, 08:43

## 5.2.2.4.5 Verilog with Sub-modules

### Code:
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
module top(in,out);
  dff_p d1(out,in,clk);
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

## 5.2.2.4.6 Verilog with Sub-modules inside a single module

### Code:
module top(in,out);
  dff_p d1(out,in,clk);
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

# 12.09.2019, 08:56

## 5.2.2.6.1 Verilog with sub-modules inside an if-else statement

### Code:
module top(in,out);
  if (in==0) begin
	dff_p d1(out,in,clk);
  end
  else begin
	dff_p d2(out,in,clk);
  end
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

# 12.09.2019, 09:01

## 5.2.2.6.2 Verilog with sub-modules inside an if-else statement

### Code:
module top(in,out);
  if (in==0) begin
	dff_p d1(out,in,clk);
  end
  else begin
	dff_p d2(out,in,clk);
  end
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

# 12.09.2019, 09:06

## 5.2.2.6.3 Verilog with sub-modules inside an if-else statement

### Code:
module top(in,out);
  if (in==0) begin
	dff_p d1(out,in,clk);
  end
  else begin
	dff_p d2(out,in,clk);
  end
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

# 12.09.2019, 09:25

## 5.2.2.6.4 Verilog with sub-modules inside an if-else statement

### Code:
module top(in,out);
  if (in==0) begin
	dff_p d1(out,in,clk);
  end
  else begin
	dff_p d2(out,in,clk);
  end
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'b0;
	$monitor("%m: Output at init: %b",out);
	$monitor("%m: Input at init: %b",in);
  end
  always @(posedge clk) begin
	out=~out;
	$monitor("%m: Output at posedge clk: %b",out);
  end
  assign in=out;
endmodule
### Result:
%m: Top-level testbench module
clk=0, in=0, out=0
clk=1, in=0, out=1
clk=0, in=0, out=0
clk=1, in=0, out=1
#### End of result

# 12.09.2019, 09:41

## 5.2.2.6.5 Verilog with sub-modules inside an if-else statement

### Code:
module top(in,out);
  if (in==0) begin
	dff_p d1(out,in,clk);
  end
  else begin
	dff_p d2(out,in,clk);
  end
endmodule
module dff_p(out,in,clk);
  reg out;
  initial begin
	out=1'