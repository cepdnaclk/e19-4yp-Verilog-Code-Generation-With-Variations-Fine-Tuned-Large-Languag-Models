module par_struct(x1, x2, x3, x4, all_ones, parity);
input [3:0] x1, x2, x3, x4;
output all_ones, parity;
logic all_ones_temp, parity_temp;
struct packed {logic data; logic parity; logic all_ones;} a, b, c, d;
assign a.data = x1[0];
assign a.all_ones = ~a.data;
assign a.parity = ^x1;
assign b.data = x2[0];
assign b.all_ones = ~b.data;
assign b.parity = ^x2;
assign c.data = x3[0];
assign c.all_ones = ~c.data;
assign c.parity = ^x3;
assign d.data = x4[0];
assign d.parity = ^x4;
assign parity = ^(a.data, b.data, c.data, d.data);
assign all_ones = &(a.all_ones, b.all_ones, c.all_ones, d.all_ones);
endmodule
### Suggested Code to Test:
module par_struct_tb;
par_struct dut(
   .x1(1'b1),
   .x2(1'b1),
   .x3(1'b1),
   .x4(1'b1)
);
default clocking @(posedge clk);
    endclocking
    initial begin
        clk = 1;
        rst = 1;
        repeat (2) @(posedge clk);
        rst = 0;
        repeat (5) @(posedge clk);
    end
    always @(posedge clk);
    assert ($stable(dut.all_ones)) else $error("all_ones is not stable");
    assert ($stable(dut.parity)) else $error("parity is not stable");
    assert (dut.parity === 1) else $error("parity is %b, but should be 1", dut.parity);
    assert (