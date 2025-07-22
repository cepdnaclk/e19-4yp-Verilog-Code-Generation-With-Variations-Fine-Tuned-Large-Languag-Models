module example4(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;
endmodule
### Modified Instruction:
Replace wait(c) with a blocking assignment inside a structure containing rand members.
### Modified Testbench Code:

module example4_tb;
rand logic c1, c2, c3;
logic x1, x2, x3, x4, g, h, f;

example4 dut (.*);

initial begin
#1000 $finish;
end

task automatic get_random;
c1 = $random;
c2 = $random;
c3 = $random;
endtask

initial begin
get_random();
fork
begin
forever
begin
@(negedge dut.clk)
begin
if(dut.i > 5)
begin
	repeat(dut.i-5) @(negedge dut.clk);
	get_random();
end
end
end
end
join_none
end

initial begin
while(dut.i < 6)
begin
	@(negedge dut.clk);
end
forever begin
@(posedge dut.clk);
//$display("at %0d, i = %0d, x1 = %b, x2 = %b, x3 = %b, x4 = %b, f = %b, g = %b, h = %b", $time, dut.i, dut.x1, dut.x2, dut.x3, dut.x4, dut.f, dut.g, dut.h);
//$display("at %0d, g = %b, h = %b", $time, dut.g, dut.h);
//$display("at %0d, f = %b", $time, dut.f);
//$display("i = %0d", dut.i);
//$display("x1 = %b", dut.x1);
//$display("x2 = %b", dut.x2);
//$display("x3 = %b", dut.x3);
//$display("x4 = %b", dut.x4);
dut.x1 = c1;
dut.x2 = c2;
dut.x3 = c3;
dut.x4 = ~c1 & c2 & c3;
wait(dut.f == 1);
end
end
endmodule
### Output:
```
Verifying example4...
Example 4
  Example 4 random variation 2020-Oct-29 18:02:27
    Info: Random seed = 898721593
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1000 ps
    Verification failed on 1000 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1000 ps
    Verification failed on 1013 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1013 ps
    Verification failed on 1013 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1013 ps
    Verification failed on 1289 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1289 ps
    Verification failed on 1505 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1505 ps
    Verification failed on 1517 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 1517 ps
    Verification failed on 2227 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |
    |:------:|:---------:|:-------:|:----------:|:---------------:|:--------------:|
    |        |           |          |             |                 |                 |
    |     c1 |          2|    1    | 1 - 1      | 0               |                 |
    |     c2 |          2|    1    | 1 - 1      | 0               |                 |
    |     c3 |          2|    1    | 1 - 1      | 0               |                 |
    --------------------------------------------------------------------------------
    Verification failed on 2227 ps
    Verification failed on 2300 ps
    --------------------------------------------------------------------------------
    | Symbol |      N    |  Fatal  |    Errors  |     Warnings    |     Notes      |