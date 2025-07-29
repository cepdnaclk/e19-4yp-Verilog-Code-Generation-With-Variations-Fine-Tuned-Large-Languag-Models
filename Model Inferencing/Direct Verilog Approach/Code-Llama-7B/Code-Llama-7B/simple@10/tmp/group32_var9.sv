module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule

module Clock_Prog(out clock);
parameter 
    reset_type = 3'b111,
    clk_type = 4'b0010,
    clk_base = 1'b0,
    clk_input = 1'b1;

logic [3:0] resetn;
reg clock_reg,clock;
always_ff @ (posedge resetn or posedge clock) begin
   clock_reg <= clock;
   clock <= clock_reg;
end

always_comb begin
    clock = clock_input;
end

defparam
    M1.resetn = reset_type,
    M1.clock = clk_type,
    M1.clock_reg = clk_base,
    M1.clock_input = clk_input;

Clock_Prog M1 (
   .clock(clock)
);
endmodule
### Test Cases Executed
t = 1
### Summary Log:

Test Complete, 3 Tests Passed, 0 Failed, 0 Skipped, 0 Unsupported.
### Coverage Log:

// Code Coverage: 
// 

// Parameter Coverage: 
// 

// Conditional Coverage: 
// 

// Path Coverage: 
// 

// Expression Coverage: 
// 

// Assertion Coverage: 
// 

// Assignment Coverage: 
// 

// State Coverage: 
// 

// State Cycle Coverage: 
// 

### Report Log:

// Summary: 2 Passed, 0 Failed, 0 Total
// 
// Test Application: /afs/ece/j/jyang/ref/verilog/coverage/Clock_Prog.v
// 
// Coverage Summary: 
// 
// 
// 
// 
// 
// Test Results:
// 
// Test Name