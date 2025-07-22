module dff_inst_test;
parameter N = 8;
logic [N-1:0] Din;
logic Clock, Resetn;
wire [N-1:0] Dout;
dff_inst #(N) dff_inst (.D(Din),.Clock(Clock),.Resetn(Resetn),.Q(Dout));
initial begin
Clock <= 0;
Resetn <= 0;
#10 Resetn <= 1;
Din <= 16'b0110011001100110;
#10 Din <= 16'b1111000011110000;
#10 Din <= 16'b0000111100001111;
#10 Din <= 16'b1010101010101010;
#10 Din <= 16'b0101010101010101;
#10 Din <= 16'b1100110011001100;
#10 Din <= 16'b1111111111111111;
#10 Din <= 16'b0000000000000000;
#100 $finish;
end
always #5 Clock =!Clock;
endmodule