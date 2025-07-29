module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Source Code:
module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Testbench Code:
module tb_func1();

    logic x1, x2, x3, f;
    func1 dut(x1, x2, x3, f);

    initial begin
        x1 = 'd1;
        x2 = 'd1;
        x3 = 'd1;
        #10;
        x1 = 'd0;
        x2 = 'd0;
        x3 = 'd1;
        #10;
        x1 = 'd1;
        x2 = 'd0;
        x3 = 'd0;
        #10;
        x1 = 'd0;
        x2 = 'd1;
        x3 = 'd0;
        #10;
        x1 = 'd0;
        x2 = 'd0;
        x3 = 'd0;
        #10;
    end

endmodule

module func1(x1, x2, x3, f);
input x1, x2, x3;
output signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule

module tb_func1();

    logic x1, x