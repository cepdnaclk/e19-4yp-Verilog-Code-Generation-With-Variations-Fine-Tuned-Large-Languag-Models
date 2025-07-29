module func1(x1, x2, x3, f);
input x1, x2, x3;
logic signed [3:0] f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Simulation code:
`timescale 1ns/1ns
module testbench();
logic x1, x2, x3, f;
func1 m1(x1, x2, x3, f);
integer j;
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,m1);
    for (j = 0; j < 15; j++) begin
        $display("x1 = %b, x2 = %b, x3 = %b", x1, x2, x3);
        #1
        if (x1) x1 = 1'b1; else x1 = 1'b0;
        if (x2) x2 = 1'b1; else x2 = 1'b0;
        if (x3) x3 = 1'b1; else x3 = 1'b0;
        $display("f = %8b", f);
        #1
    end
end
endmodule
### Simulation