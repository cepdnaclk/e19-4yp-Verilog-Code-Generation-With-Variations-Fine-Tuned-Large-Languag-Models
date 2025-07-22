module tst_dff_pbeh();
logic di,clk;
dff_p d1(do,di,clk); // Instantiate DFF with path delay
initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
always #5 di=~di; // Toggle data
initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
###