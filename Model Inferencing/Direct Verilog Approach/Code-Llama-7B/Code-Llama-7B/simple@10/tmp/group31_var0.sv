module func2(x1, x2, x3, f);
input x1, x2, x3;
output logic f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule

module func2_tb();
reg x1, x2, x3;
wire f;

func2 f1(x1, x2, x3, f);

initial begin
    x1 = 0;
    x2 = 0;
    x3 = 0;
    #100 $finish;
end
endmodule

### Testbench Output: