`timescale 1ns/100ps
module ALU8 (input [7:0] left, right, input [1:0] mode, output reg [7:0] ALUout);
always_comb begin
    case (mode)
        0: ALUout[7:0] = left + right;
        1: ALUout[7:0] = left - right;
        2: ALUout[7:0] = left & right;
        3: ALUout[7:0] = left | right;
        default: ALUout = 8'bX;
    endcase
end
endmodule
### Simulation Code:
`timescale 1ns/100ps
module ALU8_tb;
reg [7:0] a, b;
reg [1:0] m;
wire [7:0] out;

ALU8 inst (a, b, m, out);

initial begin
    a = 8'h01;
    b = 8'h02;
    m = 2'b00;
    #20 a = 8'h03;
end

always begin
    #10;
    $display("a=%h, b=%h, m=%h, out=%h", a, b, m, out);
end

endmodule
### Simulation Output:
a=01, b=02, m=00, out=03
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m=00, out=05
a=03, b=02, m