module clock_gen_function;
  reg clk, en;
  function int random_delay();
    int min=5, max=50;
    random_delay = $urandom_range(min, max);
    // $display("random_delay=%0d", random_delay); // Debug line
  endfunction
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en)
    for (int i=0;i<3;i++) // generate 3 flops
    #(random_delay()) clk = ~clk;
  initial
  begin
    clk = 1'b0;
    en = 1'b0;
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Example Execution:
$ vsim tb_clock_gen_function
### Console Output:
random_delay=37
random_delay=44
random_delay=49
random_delay=13
random_delay=44
random_delay=49
### Note:
The random_delay function returns an int value, which is then used as the delay in the #(random_delay()) statement.
## Verilog Timing Control Constructs
## 1. Event-Driven Control Constructs
## 1.1 @*
At any time, if any element in the expression list changes state or becomes active, then the statement within the @* block will be executed.
### Example Code:
module m1;
	reg r1;
	reg r2;
	initial
	begin
		r1 = 1'b0;
		r2 = 1'b0;
		$monitor("t=%0d, r1=%0b, r2=%0b", $time, r1, r2);
	end
	@(posedge r1) $display("The value of r1 became 1 at time %t", $time);
	// or
	@(posedge r1) $display("The value of r1 became 1 at time %t", $time);
	@(r1 == 1'b0) $display("