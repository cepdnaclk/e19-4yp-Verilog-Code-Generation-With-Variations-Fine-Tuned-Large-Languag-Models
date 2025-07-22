module t_Clock_Prog ();
wire clock;
enum {clock_in,no_clock} clock_type;
reg reset;
reg reset_en;

initial #10