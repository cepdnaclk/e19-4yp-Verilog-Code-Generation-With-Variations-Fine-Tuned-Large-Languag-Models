module t_Clock_Prog ();
wire clock;

always @ (posedge clock) begin
 clock <= ~clock;
end
endmodule
module Clock_Prog(input clk);

logic clock;
parameter enum {DEFAULT, HIGH} my_enum;
default clock = 1'b1;

always @ (posedge clock) begin
 clock <= ~clock;
end
endmodule


### Base Verilog Code:
module t_Clock_Prog (output