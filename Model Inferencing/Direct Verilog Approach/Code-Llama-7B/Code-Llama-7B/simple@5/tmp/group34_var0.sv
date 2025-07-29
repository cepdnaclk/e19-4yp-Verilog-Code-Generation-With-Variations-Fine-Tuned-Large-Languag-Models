module mux4(input clk, b2, a2, a1, a0,
            input b1, b0,
            output y1, y0
           );

    assign y1 = (clk[2])? a2 : b1;
    assign y0 = (clk[1])? b0 : a0;
endmodule
### Testbench Code:
module mux4_tb;

    logic b2, a2, a1, a0,
          b1, b0,
          y1, y0;

    logic clk[3][4];