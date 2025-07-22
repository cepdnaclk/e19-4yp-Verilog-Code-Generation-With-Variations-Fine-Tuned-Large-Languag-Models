```verilog
module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule
```

```verilog
module Clock_Prog(input clock);
   enum {S0, S1, S2, S3} state = S0;

   always @(posedge clock) begin
      case(state)
         S0: state <= S1;
         S1: state <= S2;
         S2: state <= S3;
         S3: state <= S0;
      endcase
   end
endmodule
```

Note: This variation is a basic example and does not cover all the functionalities of FSMs.
In addition, if you're looking for a full-fledged example, you might want to consider using a tool like ModelSim or Icarus Verilog that supports Verilog 2005 or later and can generate coverage reports from these designs. These tools can help you identify design coverage, branch and assertion coverage, and generate a comprehensive report on the design's behavior.

Also, the enum type does not necessarily mean the system has a finite set of states. It is mostly used to define a finite set of named symbolic constants which can be used in a finite-state machine. In this case, the state variable can be set to any of the defined enum values. This is a useful tool for static analysis and design verification, but it should be used judiciously and cautiously.

Please note that the simulation of the clock, in this case, just checks the functionality of the FSM and the code itself does not contain any actual clock generation. It's necessary to have a clock interface in the testbench to generate a clock. In this base code, you would need to add:
```verilog
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end
```
to your testbench module. This module creates a clock at 10 MHz (100 nanoseconds) with a 50% duty cycle.

Finally, remember to use the `-voptargs="+cover=bcefst"` (or similar) option when compiling the design to