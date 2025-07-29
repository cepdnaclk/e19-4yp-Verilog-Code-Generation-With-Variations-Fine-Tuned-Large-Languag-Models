module Clock_Prog (clock);

parameter [1:0] state_type [1:2] = '{2{0}}; // default value

parameter default_state = 0;
parameter [1:0] state = 1;

initial begin
clock = 0;
#2
end

always begin
#2 clock = 1;
#2 clock = 0;
end

endmodule
### Test Bench code:
module t_Clock_Prog ();
wire clock;

initial #100 $finish;
Clock_Prog M1 (clk);
endmodule