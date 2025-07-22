module t_Clock_Prog_with_enum();
wire clock;

typedef enum bit { Resetn=0, Setn=1} Resetn_Type;
Resetn_Type Resetn;

initial #100 $finish;
Clock_Prog M1 (clk, Resetn);
endmodule
### Expected Result:
100
###
###
###
###
###
###
###
#
###
###
###
###
###