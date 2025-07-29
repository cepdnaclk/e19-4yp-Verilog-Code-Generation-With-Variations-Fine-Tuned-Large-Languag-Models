module alu_tb;
    reg [7:0] a = 0;
    reg [7:0] b = 0;
    reg [3:0] op = 0;
    reg clk = 0;
    reg rst = 0;
    wire [7:0] sw = 0;
    wire [7:0] ld = 0;

    reg signed [7:0] aswi = 0;
    reg signed [7:0] bswi = 0;
    reg signed [3:0] opi = 0;

    alu dut (
       .a(aswi),
       .b(bswi),
       .op(opi),
       .ld(sw)
    );

    always begin
        clk = 1;
        #12 $finish;
    end

    always@* begin
        if(op == 0) begin
            $display("a = %0d, b = %0d, op = 0, ld = %0d, sw = %0d", a, b, ld, sw);
            aswi = a;
            bswi = b;
            opi = op;
        end 
        else if(op == 1) begin
            $display("a = %0d, b = %0d, op = 1, ld = %0d, sw = %0d", a, b, ld, sw);
            aswi = a;
            bswi = b;
            opi = op;
        end 
        else if(op == 2) begin
            $display("a = %0d, b = %0d, op = 2, ld = %0d, sw = %0d", a, b, ld, sw);
            aswi = a;
            bswi = b;
            opi = op;
        end 
        else if(op == 3) begin
            $display("a = %0d, b = %0d, op = 3, ld = %0d, sw = %0d", a, b, ld, sw);
            aswi