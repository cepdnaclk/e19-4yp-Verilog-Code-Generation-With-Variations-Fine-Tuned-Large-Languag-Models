module clock_gen_forever_func;
  reg clk, en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  // Function returning a range of values (can have arbitrary length)
  function rangen [1:0] range_func(input int num);
    rangen ret[1:0];
    for (int i=0; i<num; i=i+1)
      ret[i]=i;
    return ret;
  endfunction
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Simulation Logic:
  clk=0, t=0, en=0
  clk=0, t=2, en=0
  clk=1, t=4, en=0
  clk=0, t=6, en=0
  clk=0, t=8, en=0
  clk=1, t=10, en=0
  clk=0, t=12, en=0
  clk=0, t=14, en=0
  clk=1, t=16, en=0
  clk=0, t=18, en=0
  clk=0, t=20, en=0
  clk=1, t=22, en=0
  clk=0, t=24, en=0
  clk=0, t=26, en=0
  clk=1, t=28, en=0
  clk=0, t=30, en=0
  clk=0, t=32, en=0
  clk=1, t=34, en=0
### Pass/Fail Criteria:
The verification passes if the clock period is 5ns as expected.
### Unit Under Test:
forever loop in a module
### Instruction(s) to Test:
for loops with expressions in for loop initialization
#### Method to Test:
Procedural Testing using $monitor