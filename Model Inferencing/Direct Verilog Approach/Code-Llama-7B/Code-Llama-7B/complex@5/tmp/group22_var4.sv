module tst_dffbehen(
    input wire clk,
    input wire aresetn,
    input wire s_en,
    input wire [31:0] s_cnt,
    output wire s_Q
);
localparam M_CNT = 8'd6;

reg di,en,d;
wire do;
inside {s_cnt[31]};
generate
dffen d1(do,di,en); // Instantiate the D latch
endgenerate
always @(posedge clk)
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
d<= s_cnt[31];
end
always @(posedge clk or negedge aresetn)
begin
if(~aresetn)
s_Q <= 1'b0;
else
s_Q <= d;
end
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
d<= s_cnt[31];
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, s_cnt=%d, s_Q=%b",en,s_cnt,s_Q);
initial #50 $stop; // Stop simulation
endmodule
### Simulation Log:
### Passed
### Base Verilog Code:
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
always #4 di