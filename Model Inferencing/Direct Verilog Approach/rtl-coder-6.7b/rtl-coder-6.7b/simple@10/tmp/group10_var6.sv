module tst_alu4();
reg[1:0] f; reg cci; reg[3:0]a,b; wire[3:0]d; wire co;
alu_4 aa(d,co,a,b,f,cci); // Instantiate ALU
initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
always begin // Apply stimulus with #3 delay
end
initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co);
endmodule
### Expectation:
Should have error in cout.