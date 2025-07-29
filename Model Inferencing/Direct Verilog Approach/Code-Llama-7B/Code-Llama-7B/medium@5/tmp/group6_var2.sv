module clock_gen_forever(clk,en); // Renamed module for clarity
  output clk;
  output en;
  // Generate clock using forever loop, controlled by 'en'
  always @(posedge en) // Start clock generation on posedge en
    forever #2 clk = ~clk; // Toggle clock every 2 time units forever
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
endmodule
function [3:0] calc_idx;
  input [4:0] my_index;
  calc_idx = my_index + 1;
endfunction
module testbench;
  reg en;
  wire clk;
  clock_gen_forever dut(.*);
  initial begin
    #10; // Enable system
    en = 1'b1;
    #20; // Wait
    en = 1'b0;
    #30; // Wait
    $finish;
  end
endmodule
### Constraint Function:
function [3:0] calc_idx;
  input [4:0] my_index;
  calc_idx = my_index + 1;
endfunction
### Constraint Check:
$display("calc_idx(4'b1011)=%b", calc_idx(4'b1011));
### Simulation Result:
calc_idx(4'b1011)=5
```

---

#### Task 3

###### Implement a clock domain crossing circuit

![Clock Domain Cross]({{ site.baseurl }}{% link i/clock_domain_cross.svg %}){:.centered :}

The circuit above connects a clock domain that produces a clock signal at the fastest speed (2ns) to a clock domain that can tolerate slow clock speeds (0.5ns).
The circuit must be such that the output signals are in sync with the input clock domain. In other words, the output signals must be delayed by the **divisor** of the clock cycle of the clock domain (which is 4ns in this case).
The circuit must have 3 inputs and 3 outputs.

The input of the circuit is **clk_in**, which is connected to **clk_i**.
The output of the circuit is **clk_out**, which is connected to **clk_o**.

The circuit must use a clock enable signal to control the generation of the output signals only when the clock is stable.
**clk_en** is connected to the clock enable signal in the output circuit.

---

#### Solution

### Base verilog code:
```verilog
module clock_domain_cross(clk_out,clk_en,clk_i,clk_o); 
  parameter divisor = 4;
  reg clk_in,clk_en,clk_out;
  assign clk_o = clk_in;
  // Additional logic for clock domain crossing
  always @(posedge clk_i) begin
    clk_in <= clk_i;
    clk_en <= 1'b1;
  end
  // Create clock enable signal
  always @(posedge clk_i) begin
    if(clk_out) begin
      clk_en <= 1'b0;
    end
  end
  // Clock out is delayed by the divisor of the clock period
  always @(posedge clk_i) begin
    if(clk_en) begin
      clk_out <= #divisor clk_in;
    end
    else begin
      clk_out <= 1'b1;
    end
  end
  // Additional stimulus for simulation
  initial begin
    clk_en = 1'b0;
    clk_i = 1'b0;
    clk_out = 1'b1;
  end
  always @(negedge clk_i) begin
    #1 clk_in = 1'b1;
  end
  always @(posedge clk_i) begin
    #1 clk_i = 1'b0;
  end
endmodule
```

### Testbench code:
```verilog
module clock_domain_cross_tb;
  reg cl