module t_Clock_Prog ();
wire clock;

initial #100 $finish;
enum bit {default, non_default} Resetn;
//enum bit  {default, non_default} Resetn;
//enum logic [28:0] {default, non_default} Resetn;
//enum logic [1:0] {default, non_default} Resetn;
//enum int 28 {default, non_default} Resetn;
//enum int 1 {default, non_default} Resetn;
//enum int 29 {default, non_default} Resetn;
//enum int 10 {default, non_default} Resetn;
//enum longint 10 {default, non_default} Resetn;
//enum int unsigned 10 {