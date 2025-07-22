enum {rstn} rstn;
clock_gen gen(.clock(clock),.resetn(rstn));
### Test Bench Code:
module t_Clock_Prog ();
wire clock;


Clock_Prog M1 (clk);
endmodule
### Generated SV Code:
module t_Clock_Prog_SV();

// Clocking
clocking tb_clk @(posedge clock);
  default input #10 output #10;
  input clock;
endclocking

default clocking tb_clk;

initial begin
   rstn = 0;
   #100 $finish;
end

endmodule