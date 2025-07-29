module Clock_Prog (clock);
parameter T=1000000000000/FREQ;

parameter enum {FREQ1, FREQ2=100000001} FREQ;
reg clock;