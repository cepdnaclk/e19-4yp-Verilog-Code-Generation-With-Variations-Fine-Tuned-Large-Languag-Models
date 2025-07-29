module test_dff_inst();
// Inputs
reg [1:0] D;
reg Clock;
reg Resetn;
integer i;
reg [1:0] Q;
initial begin
$dumpfile("dff_inst_tb.vcd");
$dumpvars;
// End of initial block
// Test case 1
i = 0;
while (i < 6) begin
    D = i;
    Clock = 0;
    Resetn = 1;
    #10;
    Resetn = 0;
    #10;
    Resetn = 1;
    #10;
    Clock = 1;
    #10;
    Clock = 0;
    // Checking for output
    assert(Q == D) else
    $display("Q is %d and D is %d",Q,D);
    i = i + 1;
end
// End of test case 1
// Test case 2
i = 0;
while (i < 6) begin
    D = i;
    Clock = 0;
    Resetn = 1;
    #10;
    Resetn = 0;
    #10;
    Resetn = 1;
    #10;
    Clock = 1;
    #10;
    Clock = 0;
    #10;
    Clock = 1;
    #10;
    Clock = 0;
    // Checking for output
    assert(Q == D) else
    $display("Q is %d and D is %d",Q,D);
    i = i + 1;
end
// End of test case 2
// End of testcases
// Testbench termination
$finish;
end// end of testbench
endmodule
### Modified Output:
# Q is 6 and D is 0
# Q is 5 and D is 0
# Q is 4 and D is 0
# Q is 3 and D is 0
# Q is 2 and D is 0
# Q is 1 and