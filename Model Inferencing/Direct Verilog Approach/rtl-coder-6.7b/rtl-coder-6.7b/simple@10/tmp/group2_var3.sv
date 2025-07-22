module test;
typedef struct packed {
    bit x;
    bit y;
    bit z;
} test_s;
test_s test_s_var;
wire a;
assign #25 a = 1;
always begin
    test_s_var.x = #10 a;
end
endmodule
### Testbench:
module test_tb;
test test_inst();
reg signed [15:0] my_data = 0;
always #1000 $finish();
always begin
    my_data ++;
end
// This is my testbench code.
endmodule