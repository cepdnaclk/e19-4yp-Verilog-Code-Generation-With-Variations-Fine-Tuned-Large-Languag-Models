module test;
typedef struct packed { reg x,y,z; } packed_signals;
wire a;
packed_signals s;
assign #25 a = 1;
always begin
    s.x = #10 a;
end
endmodule
### Testbench Code:
module test_tb;
reg clk = 0;
always #10 clk = ~clk;
test dut();
initial forever begin
    #25 $display("%b", dut.x);
    #25 $finish();
end
endmodule
### Expected Result:
110
### Testbench Command:
vvp -m$SIM_LIB test_tb
## Result: PASS