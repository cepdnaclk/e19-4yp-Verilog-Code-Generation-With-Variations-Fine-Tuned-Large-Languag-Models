```verilog
`define NUM_OF_STATES 5
`define INPUT_WIDTH 4

module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
```

Verilog does not have a concept of array within macros, so to check if a constant is in the array we'll have to use a generate block. Here's how you can define `NUM_OF_STATES` and `INPUT_WIDTH` using macros:

```verilog
`define NUM_OF_STATES 5
`define INPUT_WIDTH 4

module comb_block (
  input [`NUM_OF_STATES-1:0] s_cnt,
  input [`INPUT_WIDTH-1:0] s_in,
  output signed [1:0] out
);
  always @(*) begin
    if(s_cnt inside {[0:3]}) begin
      if(s_in == 3'b010) begin
        out = 2'd1;
      end else if(s_in == 3'b100) begin
        out = 2'd2;
      end else begin
        out = 2'd0;
      end
    end else begin
      out = -2'd1;
    end
  end
endmodule

module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially