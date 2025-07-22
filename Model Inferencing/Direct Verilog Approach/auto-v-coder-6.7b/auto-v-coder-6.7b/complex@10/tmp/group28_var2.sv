```
// File: dlatch.sv
module dlatch(input en, d, output reg q, output qb);
  always @(negedge en or posedge d) // Assuming the clock is not required here, else replace 'd' with 'posedge clk'
    if (en) begin
      q <= d;
      qb <= ~d;
    end
endmodule

// File: tstdlatch.sv
module tstdlatch; //test-bench
logic d,en;
wire q,qb;
dlatch ff(en,d,q,qb); // Instantiating a D latch module
initial
begin
  d = 1'b0;
  en = 1'b0; // Latch disabled
end
always #4 en = ~en; // Enable toggles every 4 time units
always #8 d = ~d; // Data toggles every 8 time units
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
```

In the above code, the D latch (`dlatch.sv`) is defined as a module with the same inputs and outputs as the D latch in your diagram. Then in the testbench (`tstdlatch.sv`), the D latch is instantiated and the code for toggling `en` and `d` is added. The `initial $monitor` statement is used to print the values of `en`, `d`, `q`, and `qb` at each clock edge. `$stop` is used to end the simulation after 40 time units.
  
Please note that this code is a simple example and does not handle the case when `en` is high for a negative clock edge. In a real design, you would need to add appropriate handling for the `en` signal in the D latch. This is the case if you need to enable or disable the D latch at any point in time. The `always @(negedge en or posedge d)` construct mentioned is a simple way to achieve this. If the D latch is to be enabled only at the positive edge of the `