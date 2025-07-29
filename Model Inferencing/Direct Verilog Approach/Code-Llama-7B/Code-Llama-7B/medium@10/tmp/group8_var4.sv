module tst_dec2_4beh();
 wire [3:0]o;
 reg[1:0] i;
 //reg en; // Enable not used in dec2_4beh
 dec2_4beh dec(o,i);
 initial
 begin
    foreach (i[j])
        $display ("%d = TRUE ", i[j]);
 end
 initial $mon