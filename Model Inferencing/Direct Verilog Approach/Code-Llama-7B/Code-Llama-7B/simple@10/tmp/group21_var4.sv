module example4_tb(x1, x2, x3, x4, f, g, h, done);
rand bit x1, x2, x3, x4;
wire f, g, h;
wire done;
example4 uut(.x1(x1),.x2(x2),.x3(x3),.x4(x4),.f(f),.g(g),.h(h));
initial begin
    x1 = 1'bx;
    x2 = 1'bx;
    x3 = 1'bx;
    x4 = 1'bx;
    #10;
    c = 1;
    while (c <= 10) begin
        #10;
        c = c + 1;
    end
    $finish;
end
initial begin
    $display("f=%b, g=%b, h=%b, done=%b", f, g, h, done);
end
endmodule
### Verification Passed:
### Passed on DS-5