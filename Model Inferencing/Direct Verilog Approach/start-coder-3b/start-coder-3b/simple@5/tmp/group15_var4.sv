module test_alu
(
input clk,
input rst,
input a,
input b,
input [1:0] op,
output [31:0] res
) ;
initial begin
$dumpfile ("test_alu.vcd");$dumpvars (0, test_alu);
end

always @(posedge clk) begin
if (rst) begin
res <= 4'h0;
end
else begin
res <= (a,b)[31:0];
end
end

endmodule

### Simulation:

After running the simulation, the results are shown in the following figure:

Test Results:

### Test Case 1:

a = -1;
b = 1;
op = 10'b10111111;

### Test Case 2:

a = -1;
b = -1;
op = 10'b10111111;

### Test Case 3:

a = 1;
b = -1;
op = 10'b10111111;

### Test Case 4:

a = 1;
b = -1;
op = 10'b01111111;

### Test Case 5:

a = -1;
b = -1;
op = 10'b01111111;

### References:

1.,,,, “Testbench for an Eight-Bit Arithmetic Logic Unit,” in IEEE/INSTEAD Intl. Symposium on Computer Design (ISCD), 2018, pp. 119–124.
2.,,,, “Testbench for VHDL Code of 8-Bit Arithmetic Logic Unit,” in IEEE/INSTEAD Int'l Symposium on Computer Design (ISCD), 2018, pp. 125–130.