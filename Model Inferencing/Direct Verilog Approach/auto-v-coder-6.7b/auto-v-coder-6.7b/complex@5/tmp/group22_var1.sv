```verilog
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

```verilog
module dffen(q,d,en);
input d,en;
output reg q;
always @(posedge en) q <= d;
endmodule
```

```verilog
`define ARR_CONST '{1,2,3,4,5}
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
task check_s_cnt;
input integer i;
begin
  if (`ARR_CONST[i] == 1 || `ARR_CONST[i] == 2) begin : inside
    $display("s_cnt inside constant array");
  end : inside
end
endtask
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
`ifdef SIM
initial begin
  #10;
  check_s_cnt(2);
end
`endif
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation
endmodule
```

Note: This code is for simulation purposes only. It checks if `s_cnt`