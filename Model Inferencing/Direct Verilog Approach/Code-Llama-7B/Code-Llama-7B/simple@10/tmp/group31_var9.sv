module func1(x1, x2, x3, f);
input signed [2:0] x1, x2, x3;
output signed [2:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Testbench code:
module func1_test();
reg signed [3:0] x1, x2, x3;
wire signed [3:0] f;

func1 func1_i(x1, x2, x3, f);

parameter [100:0] max_len = 100;
integer len;
initial begin
    len = max_len;
    $dumpfile("func1_tb.vcd");
    $dumpvars(0, func1_test);
    #100;
    $finish;
end

initial begin
    x1 = 0;
    x2 = 0;
    x3 = 0;
    #10;
    assert(f === 0)
        else $error("assert failed for i=0");
    #10;
    x1 = 4'hf;
    #10;
    assert(f === -1)
        else $error("assert failed for i=1");
    #10;
    x2 = -4'hf;
    #10;
    assert(f === -1)
        else $error("assert failed for i=2");
    #10;
    x3 = -4'hf;
    #10;
    assert(f === 0)
        else $error("assert failed for i=3");
    #10;
    x2 = 4'hf;
    #10;
    assert(f === 0)
        else $error("assert failed for i=4");
    #10;
    x1 = 0;
    x2 = 0;
    x3 = 1;
    #10;
    assert(