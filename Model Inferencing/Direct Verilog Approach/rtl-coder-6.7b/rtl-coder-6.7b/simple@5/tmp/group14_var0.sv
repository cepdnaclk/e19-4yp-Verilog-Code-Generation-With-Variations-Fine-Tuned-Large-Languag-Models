module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa(d,co,a,b,f,cci); // Instantiate ALU
  initial begin cci=1'b0; f=2'b00; a=4'h0; b=4'h0; #30 $stop; end // Initialize & stop
  always begin
    #10 f = 2'b00; a = 4'h0; b = 4'h0;
    #10 f = 2'b01; a = 4'd6; b = 4'd3;
    #10 f = 2'b10; a = 4'h5; b = 4'h3;
    #10 f = 2'b11; a = 4'd6; b = 4'd3;
  end
  initial $monitor($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b ",cci,a,b,f,d,co); // Use %h
endmodule