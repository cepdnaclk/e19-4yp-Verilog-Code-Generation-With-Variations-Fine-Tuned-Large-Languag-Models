module t_Clock_Prog ();
wire clock;

initial #100 $finish;

// Variation added here 
enum logic {DISABLED=0,ENABLED=1} resetn;