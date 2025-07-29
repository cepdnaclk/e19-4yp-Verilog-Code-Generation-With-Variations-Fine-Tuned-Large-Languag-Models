module tst_wand2; //testbench
reg i[6:0];
wire o; // Added wire declaration
wand2 ww(i[6:2],o);
initial
begin
i[6]=0; i[5]=0; i[4]=0; i[3]=0; i[2]=1; i[1]=0; i[0]=0; // Drv1[6:2]=pull0, Drv2=pull0 -> o = pull0 (wand rule)