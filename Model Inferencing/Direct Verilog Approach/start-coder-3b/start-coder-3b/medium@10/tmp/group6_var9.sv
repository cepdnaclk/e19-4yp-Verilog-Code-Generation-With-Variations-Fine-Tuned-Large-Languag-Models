module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
### Simulation Result:
![Alt text](/Users/christinamcdonald/Desktop/CSCE6250_Verilog/Lab3/simulation_results/clock_gen_forever_simulation_result.png?raw=true "Simulation Result 1")
</hr>
<hr>
<br>
<br>
<hr>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16)</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    for (int i=0; i<2; i=i+1)
      clk[i] = clk[i-1];
  end
endmodule
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    for (int i=0; i<2; i=i+1)
      clk[i] = clk[i-1];
  end
endmodule
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression, Simplified</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  end
endmodule
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression, Simplified, Verilog Function</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  end
endmodule

function [1:0] gentime(input int t);
return t-2;
endfunction
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression, Simplified, Verilog Function, Verilog Function Call</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  end
endmodule

function [1:0] gentime(input int t);
return t-2;
endfunction
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression, Simplified, Verilog Function, Verilog Function Call, Verilog Function Call with Initial</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate clock using forever loop, controlled by 'en'
  reg [1:0] clk = {1'b0, 1'b0};
  always @(posedge en) // Start clock generation on posedge en
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  initial begin clk = 0; end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);

  always begin
    #2 clk[1] = ~clk[1]; // Toggle clock every 2 time units forever
    clk[0] = clk[1];
  end
endmodule

function [1:0] gentime(input int t);
return t-2;
endfunction
```
<br>
<hr>
<h3>Lab 3 Code: Module Clock Gen Forever (10/30/16) with For Loop, Inside Expression, Simplified, Verilog Function, Verilog Function Call, Verilog Function Call with Initial</h3>
```
module clock_gen_forever(output clk, input en); // Renamed module for clarity
  // Generate